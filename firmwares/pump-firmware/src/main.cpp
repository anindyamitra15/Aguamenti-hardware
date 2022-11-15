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
JsonArray socket_payload;
JsonObject data;
bool should_sync = false;

void click_handler(Button2 &btn);
void longpress_handler(Button2 &btn);
void on_socket_input(DynamicJsonDocument doc);

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
  button.setClickHandler(click_handler);
  button.setLongClickHandler(longpress_handler);

  socket_payload = payloadJson.to<JsonArray>();
  socket_payload.add("from_device");
  data = socket_payload.createNestedObject();
  data["chip_id"] = getChipId();

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
    data["state"] = control_pump(!pump_state());
    String output;
    // serialise and send the data over socket
    serializeJson(payloadJson, output);
    socketIO.send(sIOtype_EVENT, output);
    Serial.print("Sending payload: ");
    Serial.println(output);
    should_sync = false;
  }
}

void click_handler(Button2 &btn)
{
  should_sync = true;
}

void longpress_handler(Button2 &btn)
{
  unsigned int pressTime = btn.wasPressedFor();

  if (0 < pressTime && pressTime < 1000)
  {
    should_sync = true;
  }
}

void on_socket_input(DynamicJsonDocument doc)
{
  bool state = doc[1]["state"].as<bool>();
  Serial.print("Pump state input: ");
  Serial.println(state);
  control_pump(state);
}