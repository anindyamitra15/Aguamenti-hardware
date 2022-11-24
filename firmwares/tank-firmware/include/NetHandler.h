#ifndef __NetHandler_H__
#define __NetHandler_H__
#include <Arduino.h>
#include <ArduinoJson.h>
#include <HTTPClient.h>
#include <WebSocketsClient.h>
#include <SocketIOclient.h>
#include "Utils.h"

#define HOST "192.168.0.131" //"aguamenti-demo.herokuapp.com" // TODO: change according to yur server
#define PORT 3020            // 80
#define ROUTE "/device/login/"
#define DEVICE_SUB "to_device"
#define DEVICE_SYNC "device_sync"
#define USB_SERIAL Serial

SocketIOclient socketIO;
bool isSubscribed;
String token;
String endpoint;
void (*on_state_input_socket)(JsonObject) = NULL;

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
        isSubscribed = false;
        break;
    case sIOtype_CONNECT:
    {
        USB_SERIAL.printf("[IOc] Connected to url: %s\n", payload);

        // join default namespace (no auto join in Socket.IO V3)
        socketIO.send(sIOtype_CONNECT, "/");
    }
    break;
    case sIOtype_EVENT:
    {
        String str = (char *)payload;
        USB_SERIAL.printf("[IOc] get event: %s\n", payload);
        if (str.indexOf(DEVICE_SUB) < 0)
            return;
        DynamicJsonDocument doc(1024);
        DeserializationError error = deserializeJson(doc, payload, length);
        if (error)
        {
            return;
        }
        // extract data from the json
        if (on_state_input_socket)
            on_state_input_socket(doc[1]);
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
    socketIO.begin(HOST, PORT, ("/socket.io/?EIO=4&ep=" + endpoint + "/" + String(getChipId())));
    // socket events
    socketIO.onEvent(socketIOEvent);
    return true;
}

void socket_loop()
{
    socketIO.loop();
}

#endif