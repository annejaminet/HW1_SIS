// Add these libraries
#include <Wire.h>
#include "SSD1306Ascii.h"
#include "SSD1306AsciiWire.h"
#include <Tsl2561.h> //from Joba
#include <Sodaq_SHT2x.h>
#include "mma8652.h" //from panStamp


float xavg, yavg, zavg;

void setup()
{

  //// ADD CODE TO INITIALIZE THE COMPONENTS OF YOUR SYSTEM ///////


  /////////////////////////////////////////////////////////////////
  calibrate();
}



void loop()
{
  //// ADD CODE TO USE THE ACCELROMETER FOR EARTHQUAKE DETECTION ///////


  /////////////////////////////////////////////////////////////////

  delay(100); // keep the loop at 10Hz
}



void calibrate()
{
  


}
