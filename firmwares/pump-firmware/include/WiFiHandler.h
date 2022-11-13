#ifndef __WiFiHandler_H__
#define __WiFiHandler_H__
#include <Arduino.h>
#include <WiFiManager.h>

#define AP_SSID "Aguamenti_"

WiFiManager wifi;
WiFiClient wifiClient;

void setup_wifi()
{
    wifi.autoConnect(String(AP_SSID + getChipId()).c_str());
}
#endif