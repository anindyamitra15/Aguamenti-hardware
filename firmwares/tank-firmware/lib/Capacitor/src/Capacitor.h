#ifndef Capacitor_h
#define Capacitor_h

#include <Arduino.h>

class Capacitor
{
  public:
    Capacitor(int outPin, int inPin);
    int Measure();                
    void Calibrate(bool on);       // "true" to show debug messages
  private:
    int _lowerADC = 2600;
    int _upperADC = 3500;
    int _outPin;                    
    int _inPin;
    bool _showAnalogReadData;
};

#endif
