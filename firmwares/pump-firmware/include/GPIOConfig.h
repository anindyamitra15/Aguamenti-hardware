#ifndef __GPIOCONFIG_H__
#define __GPIOCONFIG_H__
#include <Arduino.h>
#include <Button2.h>

#define LED 2
#define PUMP 16
#define BUTTON 17
#define ZVD 18

Button2 button;

void setup_gpio()
{
    pinMode(LED, OUTPUT);
    pinMode(PUMP, OUTPUT);
    button.begin(BUTTON, INPUT_PULLUP);
}

// call this function in void loop
void io_loop()
{
    button.loop();
}

bool control_pump(bool state)
{
    digitalWrite(PUMP, state);
    return state;
}

bool pump_state()
{
    return digitalRead(PUMP);
}

#endif