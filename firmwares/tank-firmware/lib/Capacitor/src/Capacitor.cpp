#include <Arduino.h>
#include "Capacitor.h"

Capacitor::Capacitor(int outPin, int inPin)
{
    _outPin = outPin;
    _inPin = inPin;
    digitalWrite(_outPin, LOW);
    digitalWrite(_inPin, LOW);
    pinMode(_outPin, OUTPUT);
    pinMode(_inPin, OUTPUT);
    _showAnalogReadData = false;
}

void Capacitor::Calibrate(bool on)
{
    _showAnalogReadData = on;
}

int Capacitor::Measure()
{
    int level;
    pinMode(_inPin, INPUT);                 // Rising high edge on OUT_PIN
    digitalWrite(_outPin, HIGH);
    int val = analogRead(_inPin);
    digitalWrite(_outPin, LOW);
    pinMode(_inPin, OUTPUT);

	if (_showAnalogReadData)
	{
		Serial.print(F("Analog pin reading: "));
		Serial.println(val);
	}
	
	if(val < _lowerADC)
		level = 0;
	else if(val > _upperADC)
		level = 100;
    else
        level = map(val, _lowerADC, _upperADC, 0, 100);		// Needed calibration
	
    return level;
}
