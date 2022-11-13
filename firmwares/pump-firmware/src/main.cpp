/**
 * pump firmware main file
 * connects the pump to Aguamenti server
 * sync pump state thru socket
 * authorize itself with HTTP
 * WiFiManager
 * HTTP Client
 * Socket IO Client
 * SPIFFS
 * ArduinoJSON
 */

#include <Arduino.h>
#include "WiFiHandler.h"
#include "NetHandler.h"
#include "GPIOConfig.h"

void setup()
{
  Serial.begin(115200);
  setup_gpio();
  delay(2000);
  setup_wifi();
  if (!http_login())
    while (1) // trigger watchdog
      ;
    socket_connect();
}

void loop()
{
  socketIO.loop();
  static unsigned long last_time = 0;
  if (millis() - last_time > 2000)
  {
    DynamicJsonDocument docOut(1024);
    JsonArray array = docOut.to<JsonArray>();

    array.add("from_device");
    // add payload (parameters) for the ack (callback function)
    // JsonObject param1 = array.createNestedObject();
    // param1["now"] = millis();
    array.add(millis());

    // JSON to String (serializion)
    String output;
    serializeJson(docOut, output);
    Serial.println(output);

    // Send event
    socketIO.send(sIOtype_EVENT, output);
    last_time = millis();
  }
}