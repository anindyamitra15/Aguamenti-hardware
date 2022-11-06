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

void setup()
{
  Serial.begin(115200);
  setup_wifi();
  if (http_login())
    socket_connect();
}

void loop()
{
  socketIO.loop();
}