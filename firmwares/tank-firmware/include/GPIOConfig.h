#ifndef __GPIOCONFIG_H__
#define __GPIOCONFIG_H__
#include <Arduino.h>
#include <NewPing.h>

#define LED 2
#define SCL_PIN 22 // D22
#define SDA_PIN 21 // D21
#define DETECT_OVERFLOW 18
#define ULTRASONIC_ECHO 16 // Rx2
#define ULTRASONIC_TRIG 17 // Tx2
#define MAX_DIST_CM 600    // cm


#define INVERT_OVF_LOGIC false

// less than the height of the tank
int MIN_THRESHOLD_LEVEL = 70; // cm
// greater than 20 cm (least distance sensor can measure)
int MAX_THRESHOLD_LEVEL = 30; // cm

NewPing sonar(ULTRASONIC_TRIG, ULTRASONIC_ECHO, MAX_DIST_CM);

void setup_gpio()
{
    pinMode(LED, OUTPUT);
    pinMode(DETECT_OVERFLOW, INPUT_PULLDOWN);
    pinMode(ULTRASONIC_ECHO, INPUT);
    pinMode(ULTRASONIC_TRIG, OUTPUT);
}

void read_ultrasonic(int *data)
{
    // TODO: implement ultrasonic function here
    *data = sonar.ping_cm();
}

bool isOverflown()
{
    return INVERT_OVF_LOGIC ^ digitalRead(DETECT_OVERFLOW);
}

#endif