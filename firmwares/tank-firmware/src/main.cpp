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
#include "NetHandler.h"

#define DEFAULT_READ_INTERVAL 80
#define DEFAULT_UPLOAD_INTERVAL 2000

TaskHandle_t sync_data_task;
TaskHandle_t sensor_read_task;

void sensor_read_function(void *);
void sync_data_function(void *);

// int ultrasonic_reading;                                 // cm
int cap_sensor_reading;                                 // %
unsigned int read_interval = DEFAULT_READ_INTERVAL;     // ms
unsigned int upload_interval = DEFAULT_UPLOAD_INTERVAL; // ms

bool should_sync;
DynamicJsonDocument payloadJson(128);
JsonObject data;

void setup()
{
  Serial.begin(115200);
  setup_gpio();
  // network setup
  setup_wifi();
  if (!http_login())
  {
    Serial.println("Failed connecting to server");
    while (1) // trigger watchdog
      ;
  }
  socket_connect();
  JsonArray socket_payload;
  socket_payload = payloadJson.to<JsonArray>();
  socket_payload.add("from_device");
  data = socket_payload.createNestedObject();

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
  socketIO.loop();
  if (should_sync)
  {
    String output;
    // serialise and send the data over socket
    serializeJson(payloadJson, output);
    socketIO.send(sIOtype_EVENT, output);
    Serial.print("Sending payload: ");
    Serial.println(output);
    should_sync = false;
  }
}

void sensor_read_function(void *pvParam)
{
  for (;;)
  {
    // TODO: read data from ultrasonic and average
    // and store it to "(int)ultrasonic_reading"
    // read_ultrasonic(&ultrasonic_reading);
    read_capacitive(&cap_sensor_reading);
    data["value"] = cap_sensor_reading;
    // if reading near 0 or 100, update "upload_interval" and "read_interval"
    // static bool adjusted;

    if(cap_sensor_reading >= 90){
      data["state"] = false;
    }
    if(cap_sensor_reading <= 10){
      data["state"] = true;
    }

    // prepare the upload packet
    vTaskDelay(read_interval / portTICK_RATE_MS);
  }
}

void sync_data_function(void *pvParam)
{
  for (;;)
  {
    should_sync = true;
    vTaskDelay(upload_interval / portTICK_RATE_MS);
  }
}