/**
 * pump firmware main file
 * connects the pump to Aguamenti server
 * sync pump state thru socket
 * authorize itself with HTTP
 * WiFiManager
 * HTTP Client
 * Socket IO Client
 * SPIFFS
 * ArduinoJSON
 */

#include <Arduino.h>
#include "WiFiHandler.h"
#include "NetHandler.h"
#include "GPIOConfig.h"

DynamicJsonDocument payloadJson(64);
JsonObject data;
bool should_sync = false;

void button_event_handler(Button2 &btn);
void on_socket_input(JsonObject doc);

void setup()
{
  Serial.begin(115200);
  setup_gpio();
  delay(2000);
  setup_wifi();
  if (!http_login())
  {
    Serial.println("Failed connecting to server");
    while (1) // trigger watchdog
      ;
  }
  socket_connect();
  button.setClickHandler(button_event_handler);
  button.setLongClickHandler(button_event_handler);

  JsonArray socket_payload;
  socket_payload = payloadJson.to<JsonArray>();
  socket_payload.add("from_device");
  data = socket_payload.createNestedObject();

  on_state_input_socket = on_socket_input;
}

void loop()
{
  socket_loop();
  io_loop();
  // sync queue
  if (should_sync)
  {
    // toggle the pump state and update the json
    String output;
    // serialise and send the data over socket
    serializeJson(payloadJson, output);
    socketIO.send(sIOtype_EVENT, output);
    Serial.print("Sending payload: ");
    Serial.println(output);
    should_sync = false;
  }
}

void button_event_handler(Button2 &btn)
{
  bool triggered = false;
  switch (btn.getType())
  {
  case single_click:
    triggered = true;
    break;
  case long_click:
  {
    unsigned int pressTime = btn.wasPressedFor();
    if (0 < pressTime && pressTime < 1000)
      triggered = true;
  }
  break;
  default:
    break;
  }

  if (triggered)
  {
    data["state"] = control_pump(!pump_state());
    should_sync = true;
  }
}

void on_socket_input(JsonObject doc)
{
  bool state = doc["state"].as<bool>();
  Serial.print("Pump state input: ");
  Serial.println(control_pump(state));
}