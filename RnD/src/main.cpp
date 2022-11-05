#include <Arduino.h>
#include <Wire.h>
#include <NewPing.h>
#include <LiquidCrystal_I2C.h>
#include <BigNumbers_I2C.h>

#define LCD_I2C_ADDR 0x27

void lcd_setup();
void display_dist(unsigned int);

unsigned int distance;

#define TRIG 12
#define ECHO 13
#define MAX_DIST_CM 600

#define COL 16
#define ROW 2


LiquidCrystal_I2C lcd(LCD_I2C_ADDR, COL, ROW);
BigNumbers_I2C bigNum(&lcd);

// Ultrasonic ultrasonic(TRIG, ECHO);
NewPing sonar(TRIG, ECHO, MAX_DIST_CM);

void setup()
{
  Serial.begin(9600);
  lcd_setup();
}

void loop()
{
  static bool boot = false;

  // sensor read schedule
  static unsigned long last_read = 0;
  if (!boot || millis() - last_read >= 50)
  {
    distance = sonar.ping_cm();
    Serial.println(distance);
    last_read = millis();
  }

  // result update schedule
  static unsigned long last_disp = 0;
  if ((!boot) || millis() - last_disp >= 1000)
  {
    display_dist(distance);
    last_disp = millis();
  }

  if (!boot)
    boot = true;
}

void lcd_setup()
{
  lcd.begin();
  bigNum.begin();
  lcd.backlight();
  lcd.clear();
  lcd.setCursor(0, 1);
  lcd.print("Dist:");
  lcd.setCursor(14, 1);
  lcd.print("cm");
}

void display_dist(unsigned int cm)
{
  bigNum.displayLargeInt(cm, 5, 0, 3, false);
}