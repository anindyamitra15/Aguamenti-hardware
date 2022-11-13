#ifndef __GPIOCONFIG_H__
#define __GPIOCONFIG_H__
#include <Arduino.h>
#define LED 2
#define PUMP 16

void setup_gpio()
{
    pinMode(LED, OUTPUT);
    pinMode(PUMP, OUTPUT);
}

#endif