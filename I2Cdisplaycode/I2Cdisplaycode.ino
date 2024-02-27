#include <Arduino.h>
#include <U8g2lib.h>
#include <Wire.h>

U8G2_SSD1306_128X64_NONAME_1_HW_I2C u8g2(U8G2_R0, /* reset=*/ U8X8_PIN_NONE);

const char *labelArray[] = {"Temp:", "Humidity:", "CO:", "CO2:", "Pressure:", "Air Quality:"};
const char *valueArray[] = {"22C", "50%", "350 ppm", "450 ppm", "1013 hPa", "Good"};
//pins SDA A4 en SCK A5
void shiftArrays() {
  // Shift both labelArray and valueArray
  const char *tempLabel = labelArray[0];
  const char *tempValue = valueArray[0];

  for (size_t i = 0; i < 5; i++) {
    labelArray[i] = labelArray[i + 1];
    valueArray[i] = valueArray[i + 1];
  }

  labelArray[5] = tempLabel;
  valueArray[5] = tempValue;
}

void setup(void) {
  u8g2.begin();
}

void loop(void) {
  u8g2.firstPage();
  do {
    u8g2.setFont(u8g2_font_profont15_tf);  // Change to a smaller font (adjust as needed)
    
    for (size_t i = 0; i < 6; i++) {
      String displayString = String(labelArray[i]) + " " + String(valueArray[i]);
      u8g2.drawStr(0, 20 + i * 20, displayString.c_str());  // Adjusted positioning
    }
  } while (u8g2.nextPage());

  delay(3000);  // Display each set for 3 seconds

  // Shift both arrays for the next cycle
  shiftArrays();
}
