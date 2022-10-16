#define SCHEDULE(last_time, rate) \
    if(millis() - last_time >= rate)

#define END_SCHEDULE(last_time) \
    last_time = millis()