#ifndef __Utils_H__
#define __Utils_H__
#include <Arduino.h>

unsigned long getChipId()
{
#ifdef ESP8266
    return ESP.getChipId();
#elif ESP32
    static unsigned long chipId = 0;
    if (chipId != 0)
        return chipId;
    for (int i = 0; i < 17; i = i + 8)
    {
        chipId |= ((ESP.getEfuseMac() >> (40 - i)) & 0xff) << i;
    }
    return chipId;
#endif
}

#endif