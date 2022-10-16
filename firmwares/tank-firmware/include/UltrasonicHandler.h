#ifndef __UltrasonicHandler_H__
#define __UltrasonicHandler_H__

#include "MacroFunctions.h"

class UltrasonicHandler
{
public:
    /**
     * @param *distance bind pointer to the global distance variable
     */
    void begin(int *distance)
    {
        this->distance = distance;
        // TODO: init ultrasonic object
    }

    /**
     * @param *distance bind pointer to the global distance variable
     * @param polling_rate after how many millisec. should data be polled from the sensor, default 100ms
     */
    void begin(int *distance, unsigned long polling_rate)
    {
        this->polling_rate = polling_rate;
        this->begin(distance);
    }

    /**
     * Put this method in the super loop
     * This method fetches the sensor data according to the polliung rate
     * needs a non-blocking super-loop (no delay() should be in the loop() in main file)
     */
    void loop()
    {
        static unsigned long last_time = 0;
        SCHEDULE(last_time, polling_rate)
        {
            fetch_sensor();
            END_SCHEDULE(last_time);
        }
    }

    /**
     * @return distance (dereferenced integer)
     */
    int fetch_sensor()
    {
        // TODO: fetch from the ultrasonic sensor
        // perform computations
        // update the distance pointer
        return *distance;
    }

    void calibrate(); // TODO: calibrate function - feel free to change function signature

    void update_polling_rate(int polling_rate)
    {
        this->polling_rate = polling_rate;
    }

private:
    int *distance;
    unsigned long polling_rate = 100;
};
UltrasonicHandler ultrasonicHandler;

#endif