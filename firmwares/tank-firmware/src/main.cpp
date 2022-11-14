/**
 * tank firmware main file
 * connects the tank to Aguamenti server
 * sync water level thru socket
 * authorize itself with HTTP
 * WiFiManager
 * HTTP Client
 * Socket IO Client
 * SPIFFS
 * ArduinoJSON
 */

#include <Arduino.h>
#include "GPIOConfig.h"
#include "WiFiHandler.h"

TaskHandle_t sync_data_task;
TaskHandle_t sensor_read_task;

void sensor_read_function(void *);
void sync_data_function(void *);

int ultrasonic_reading = 0;          // cm
unsigned int read_interval = 80;     // ms
unsigned int upload_interval = 5000; // ms

void setup()
{
  Serial.begin(115200);
  setup_gpio();
  // network setup
  setup_wifi();
  xTaskCreatePinnedToCore(
      sensor_read_function,
      "sensor_read_function",
      1000, NULL, 2,
      &sensor_read_task, 0);
  xTaskCreatePinnedToCore(
      sync_data_function,
      "sync_data_function",
      1000, NULL, 1,
      &sync_data_task, 0);
}

void loop()
{
  // perform network operations here
}

void sensor_read_function(void *pvParam)
{
  for (;;)
  {
    // TODO: read data from ultrasonic and average
    // and store it to "(int)ultrasonic_reading"
    // if reading near 0 or 100, update "upload_interval" and "read_interval"
    // detect overload and sync data as soon as overload occurs
    //
    vTaskDelay(read_interval / portTICK_RATE_MS);
  }
}

void sync_data_function(void *pvParam)
{
  for (;;)
  {

    vTaskDelay(upload_interval / portTICK_RATE_MS);
  }
}