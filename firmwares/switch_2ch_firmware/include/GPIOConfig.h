#ifndef __GPIOCONFIG_H__
#define __GPIOCONFIG_H__
#include <Arduino.h>
#include <Button2.h>

#define LED 2
#define OUT_1 21       // D21
#define OUT_2 19       // D19
#define ZVD 25         // D25
#define SWITCH_IN_2 17 // Tx2
#define SWITCH_IN_1 16 // Rx2
#define NUM_KEYS 2

enum device_type // shouldn't have a -ve value
{
    SWITCH = 0,
    SLIDER = 1,
    PUMP = 2,
    TANK_LEVEL = 3
};

// signature for 2 channel board: one slider, one toggle
uint8_t const keys[NUM_KEYS][3] = {
    {OUT_1, SWITCH_IN_1, SLIDER},
    {OUT_2, SWITCH_IN_2, SWITCH},
};

Button2 button[NUM_KEYS];

void (*button_handler)(Button2 &btn) = NULL;

void setup_gpio()
{
    pinMode(LED, OUTPUT);
    for (int i = 0; i < NUM_KEYS; i++)
    {
        pinMode(keys[i][0], OUTPUT);
    }

    for (int i = 0; i < NUM_KEYS; i++)
    {
        button[i].begin(keys[i][1], INPUT_PULLUP);
        if (button_handler != NULL)
        {
            button[i].setClickHandler(button_handler);
            button[i].setLongClickHandler(button_handler);
        }
    }
    pinMode(ZVD, INPUT);
}

void io_loop()
{
    for (int i = 0; i < NUM_KEYS; i++)
        button[i].loop();
}

#endif