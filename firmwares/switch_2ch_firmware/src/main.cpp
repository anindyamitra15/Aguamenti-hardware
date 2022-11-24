#include <Arduino.h>
#include "WiFiHandler.h"
#include "NetHandler.h"
#include "GPIOConfig.h"

DynamicJsonDocument payloadJson(64);
JsonObject data;
bool should_sync = false;

void on_socket_input(JsonObject doc);

void button_handle(Button2 &btn);

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
  JsonArray socket_payload = payloadJson.to<JsonArray>();
  socket_payload.add("from_device");
  data = socket_payload.createNestedObject();
}

void loop()
{
  socket_loop();
  io_loop();
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

void on_socket_input(JsonObject doc)
{
  uint8_t data_info;
  bool state;
  int value;
  uint8_t key = 0;

  if (doc["key"] != NULL)
  {
    key = doc["key"];
  }
  if (doc["state"] != NULL)
  {
    state = doc["state"];
    data_info |= 0x01;
  }
  if (doc["value"] != NULL)
  {
    value = doc["value"];
    data_info |= 0x02;
  }

  set_state(keys[key], &data_info, state, value);
}

void set_state(uint8_t const *handle, uint8_t *data_info, bool state, int value)
{
  switch (handle[2])
  {
  case SWITCH:
  case PUMP:
  {
    switch (*data_info)
    {
    case 0x01: // only state
      digitalWrite(handle[0], state);
      break;
    case 0x02: // only value
      digitalWrite(handle[0], value);
      break;
    case 0x03: // both state and value
      digitalWrite(handle[0], state & value);
      break;
    default:
      break;
    }
  }
  break;

  case SLIDER:
  {
    switch (*data_info)
    {
    case 0x01: // only state
      if (!state)
        analogWrite(handle[0], 0);
      break;
    case 0x02: // only value
      analogWrite(handle[0], value);
      break;
    case 0x03: // both state and value
      analogWrite(handle[0], state ? value : 0);
      break;
    default:
      break;
    }
  }
  break;

  default:
    break;
  }
}

void button_handle(Button2 &btn)
{
  bool triggered;
  switch (btn.getType())
  {
  case single_click:
    triggered = true;
    break;
  case long_click:
    unsigned int pressTime = btn.wasPressedFor();

    if (0 < pressTime && pressTime < 1000)
      bool triggered = true;
    break;
  default:
    break;
  }

  if (triggered)
  {
    for (int i = 0; i < NUM_KEYS; i++)
      if (btn == button[i])
      {
        uint8_t data_info = 0x01;
        set_state(
            keys[i],
            &data_info,
            !digitalRead(keys[i][0]),
            0);
        // push the state to socket as well
        data["key"] = i;
        data["state"] = digitalRead(keys[i][0]);
      }
  }
}
