#include <WaspSensorAgr_v30.h>

// Variable to store the read value
float watermark1, watermark2, watermark3;
//Instance objects
watermarkClass wmSensor1(SOCKET_1);
watermarkClass wmSensor2(SOCKET_2);
//watermarkClass wmSensor3(SOCKET_3);

void setup()
{
  // Turn on the USB and print a start message
  USB.ON();
  USB.println(F("Start program"));
  
  // Turn on the sensor board
  Agriculture.ON(); 
}
 
void loop()
{
  // Part 1: Read the Watermarks sensors one by one 
  USB.println(F("Wait for Watermark 1..."));
  watermark1 = wmSensor1.readWatermark();      
  
  USB.println(F("Wait for Watermark 2..."));  
  watermark2 = wmSensor2.readWatermark();      
  
//  USB.println(F("Wait for Watermark 3..."));  
//  watermark3 = wmSensor3.readWatermark();      
  
  // Part 2: USB printing
  // Print the watermark measures
  USB.print(F("Watermark 1 - Frequency: "));
  USB.print(watermark1);
  USB.println(F(" Hz"));
  
  USB.print(F("Watermark 2 - Frequency: "));
  USB.print(watermark2);
  USB.println(F(" Hz"));  
 
 // USB.print(F("Watermark 3 - Frequency: "));
 // USB.print(watermark3);
 // USB.println(F(" Hz"));  
 // USB.println();

  delay(1000);
}
