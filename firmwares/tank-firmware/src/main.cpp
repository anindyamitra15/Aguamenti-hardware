/**
 * tank firmware main file
 * connects the tank to Aguamenti server
 * sync water level thru socket
 * authorize itself with HTTP
 * WiFiManager
 * HTTP Client
 * Socket IO Client
 * SPIFFS
 * ArduinoJSON
 */

#include <Arduino.h>
#include "UltrasonicHandler.h"

int DISTANCE = 0;

void setup()
{
  ultrasonicHandler.begin(&DISTANCE);
}

void loop()
{
  ultrasonicHandler.loop();
}