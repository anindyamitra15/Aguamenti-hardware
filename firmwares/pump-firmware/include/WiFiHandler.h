#ifndef __WiFiHandler_H__
#define __WiFiHandler_H__
#include <Arduino.h>
#include <WiFiManager.h>

#define AP_SSID "Aguamenti"

WiFiManager wifi;
WiFiClient wifiClient;

void setup_wifi()
{
    wifi.autoConnect(AP_SSID);
}
#endif