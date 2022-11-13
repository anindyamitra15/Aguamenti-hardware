#ifndef __NetHandler_H__
#define __NetHandler_H__
#include <Arduino.h>
#include <ArduinoJson.h>
#include <HTTPClient.h>
#include <WebSocketsClient.h>
#include <SocketIOclient.h>
#include "Utils.h"

#define HOST "192.168.245.239" // TODO: change according to yur server
#define PORT 3020
#define ROUTE "/device/login/"
#define PUMP_STATE_TOPIC "pump_state"
#define DEVICE_SUB "to_device"
#define USB_SERIAL Serial

SocketIOclient socketIO;
String token;
String endpoint;

bool http_login()
{
    // http login
    HTTPClient http;
    String url = "http://" + String(HOST) + ":" + String(PORT) + String(ROUTE) + String(getChipId());
    USB_SERIAL.println(url);
    if (!http.begin(url))
        return false;
    int httpCode = http.GET();
    if (
        httpCode <= 0 ||
        httpCode != 200)
    {
        http.end();
        return false;
    }

    DynamicJsonDocument doc(1024);
    DeserializationError error = deserializeJson(doc, http.getString());
    if (error)
        return false;
    token = doc["result"]["token"].as<String>();
    endpoint = doc["result"]["endpoint"].as<String>();
    Serial.println(endpoint);
    doc.clear();
    http.end();
    return true;
}

void socketIOEvent(socketIOmessageType_t type, uint8_t *payload, size_t length)
{
    switch (type)
    {
    case sIOtype_DISCONNECT:
        USB_SERIAL.printf("[IOc] Disconnected!\n");
        break;
    case sIOtype_CONNECT:
        USB_SERIAL.printf("[IOc] Connected to url: %s\n", payload);

        // join default namespace (no auto join in Socket.IO V3)
        socketIO.send(sIOtype_CONNECT, "/");
        break;
    case sIOtype_EVENT:
    {
        String str = (char *)payload;
        if (str.indexOf(DEVICE_SUB) < 0)
            return;
        char *sptr = NULL;
        int id = strtol((char *)payload, &sptr, 10);
        USB_SERIAL.printf("[IOc] get event: %s id: %d\n", payload, id);
        if (id)
        {
            payload = (uint8_t *)sptr;
        }
        DynamicJsonDocument doc(1024);
        DeserializationError error = deserializeJson(doc, payload, length);
        if (error)
        {
            return;
        }

        // String eventName = doc[0];
        // USB_SERIAL.printf("[IOc] event name: %s\n", eventName.c_str());

        // Message Includes a ID for a ACK (callback)
        if (id)
        {
            // creat JSON message for Socket.IO (ack)
            DynamicJsonDocument docOut(1024);
            JsonArray array = docOut.to<JsonArray>();

            // add payload (parameters) for the ack (callback function)
            JsonObject param1 = array.createNestedObject();
            param1["now"] = millis();

            // JSON to String (serializion)
            String output;
            output += id;
            serializeJson(docOut, output);

            // Send event
            socketIO.send(sIOtype_ACK, output);
        }
    }
    break;
    default:
        Serial.println(type);
        break;
    }
}

bool socket_connect()
{
    // socket connect
    String header = "Authorization: Bearer " + token;
    socketIO.setExtraHeaders(header.c_str());
    socketIO.begin(HOST, PORT, "/socket.io/?EIO=4");
    // socket events
    socketIO.onEvent(socketIOEvent);
    return true;
}
#endif