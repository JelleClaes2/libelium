#include <WaspSensorAgr_v30.h>

// Variable to store the read value
float watermark1, watermark2, watermark3;
// Variable to store the read value
float temp,humd,pres;
//Instance objects
watermarkClass wmSensor1(SOCKET_1);
watermarkClass wmSensor2(SOCKET_2);
//watermarkClass wmSensor3(SOCKET_3);

// Instance object
radiationClass radSensor;
// Variable to store the radiation conversion value
float radiation,value;
 //PT1000
 pt1000Class pt1000Sensor;
 float value2;

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
  temp = Agriculture.getTemperature();
  humd  = Agriculture.getHumidity();
  pres = Agriculture.getPressure();  
  // Part 1: Read the ultraviolet radiation sensor
  value = radSensor.readRadiation();
  radiation = value / 0.0002; 
  
  // Part 1: Read the Watermarks sensors one by one 
  USB.println(); 
  USB.println(F("Refreshing"));
  USB.println(); 
  watermark1 = wmSensor1.readWatermark();      
  watermark2 = wmSensor2.readWatermark();    

  //PT1000
  value2 = pt1000Sensor.readPT1000();  
  
//  USB.println(F("Wait for Watermark 3..."));  
//  watermark3 = wmSensor3.readWatermark();      
  
  // Part 2: USB printing
  // Print the watermark measures
  USB.println(); 
  USB.print(F("Watermark 1 - Frequency: "));
  USB.print(watermark1);
  USB.println(F(" Hz"));
  USB.print(F("Watermark 2 - Frequency: "));
  USB.print(watermark2);
  USB.println(F(" Hz")); 
  USB.println();  
 
 // USB.print(F("Watermark 3 - Frequency: "));
 // USB.print(watermark3);
 // USB.println(F(" Hz"));  
 // USB.println();
 //BME280
  USB.println(); 
  USB.print(F("Temperature: "));
  USB.print(temp);
  USB.println(F(" Celsius"));
  USB.print(F("Humidity: "));
  USB.print(humd);
  USB.println(F(" %"));  
  USB.println(); 
  
  //watermark
  USB.print(F("Pressure: "));
  USB.print(pres);
  USB.println(F(" Pa"));  
 
  USB.print(F("Radiation: "));
  USB.print(radiation);
  USB.println(F("umol*m-2*s-1"));
  USB.println();  
  
  //PT1000
  USB.print(F("PT1000: "));
  USB.printFloat(value2,3);
  USB.println(F(" ºC")); 
  delay(1000);
}
