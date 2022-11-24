#ifndef __WiFiHandler_H__
#define __WiFiHandler_H__
#include <Arduino.h>
#include <WiFiManager.h>
#include "Utils.h"
#define AP_SSID "Aguamenti_switch_"

WiFiManager wifi;
WiFiClient wifiClient;

void setup_wifi()
{
    String ap_ssid = AP_SSID + String(getChipId());
    wifi.autoConnect(ap_ssid.c_str());
}
#endif