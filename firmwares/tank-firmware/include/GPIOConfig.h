#ifndef __GPIOCONFIG_H__
#define __GPIOCONFIG_H__
#include <Arduino.h>
// #include <NewPing.h>
#include <Capacitor.h>

#define LED 2
// #define SCL_PIN 22 // D22
// #define SDA_PIN 21 // D21
#define DETECT_OVERFLOW 18
#define SENSOR_PIN_1 32 // Rx2
#define SENSOR_PIN_2 33 // Tx2
#define MAX_DIST_CM 600    // cm
#define AVG_SAMPLES 256


#define INVERT_OVF_LOGIC false

// less than the height of the tank
int MIN_THRESHOLD_LEVEL = 10; // %
// greater than 20 cm (least distance sensor can measure)
int MAX_THRESHOLD_LEVEL = 95; // cm

int average, level;

// NewPing sonar(ULTRASONIC_TRIG, ULTRASONIC_ECHO, MAX_DIST_CM);
Capacitor capSensor(SENSOR_PIN_1, SENSOR_PIN_2);

void setup_gpio()
{
    pinMode(LED, OUTPUT);
    pinMode(DETECT_OVERFLOW, INPUT_PULLDOWN);
    // pinMode(ULTRASONIC_ECHO, INPUT);
    // pinMode(ULTRASONIC_TRIG, OUTPUT);
}

void read_capacitive(int *data)
{
    // TODO: implement capacitive sensing function here
    average = 0;
    for(int i = 0; i < AVG_SAMPLES; i++)
    {
        level = capSensor.Measure();
        average += level;
    }
    level = average / AVG_SAMPLES;
    *data = level;
}

#endif