// Add these libraries
#include <Wire.h>
#include "SSD1306Ascii.h"
#include "SSD1306AsciiWire.h"
#include <Tsl2561.h> //from Joba
#include <Sodaq_SHT2x.h>
#include "mma8652.h" //from panStamp
#include <math.h> 

// Initialize OLED screen
SSD1306AsciiWire oled;

// I2C address of Oled screen
#define I2C_ADDRESS 0x3C

//I2C address of the Accelerometer

// Accelerometer object. Interruptable pin = internal ACC_INT pin
#define ACC_INT  1 // Accelerometer interrupt pin

MMA8652 accel = MMA8652(ACC_INT);

// Define proper RST_PIN if required.
#define RST_PIN -1

//#define LENGTH 100
// Used to read statuses and source registers
//uint8_t status, intSource;

//Variable declaration
float xavg, yavg, zavg;
float totvect_previous=0;
int steps =0;
int flag = 0;
float totvect = 0;
float tot_av = 0;
float xaccl = 0;
float yaccl = 0;
float zaccl= 0;
float x = 0;
float y = 0;
float z = 0; 
String data;


void setup()
{

  //// ADD CODE TO INITIALIZE THE COMPONENTS OF YOUR SYSTEM ///////
    // Initialize I2C communication
  Wire.begin();
  Wire.setClock(400000L);

  Serial.begin(9600);
  

  //// QUESTION 21 ////
  
  // Initialize serial line for communication with base station 
  Serial3.begin(9600);
  
   // Flush serial line
   Serial3.flush();
    delay(1500);
    //Activate AT command mode
    Serial3.print("+++");
    Serial3.flush();
    delay(1500);
    // ATTENTION: Change PAN ID to the ID number of the computer used
    Serial3.print("ATID 10\r");
    Serial3.print("ATCN\r"); //ExitCommandmode

  //Initialize the screen
#if RST_PIN >= 0
  oled.begin(&Adafruit128x32, I2C_ADDRESS, RST_PIN);
#else // RST_PIN >= 0
  oled.begin(&Adafruit128x32, I2C_ADDRESS);
#endif // RST_PIN >= 0

   oled.setFont(Adafruit5x7);
   oled.displayRemap(1);
   oled.setContrast(0);
  
   oled.clear();

  // Init accelerometer
  accel.init();

  /////////////////////////////////////////////////////////////////
  calibrate();
}



void loop()
{

  //// ADD CODE TO USE THE ACCELROMETER FOR EARTHQUAKE DETECTION ///////

  //// QUESTION 20 ////
  oled.home();
  oled.set1X();
  


  //Read accelerometer data from sensor
  accel.readXYZ();
  
  //Compute total acceleration vector
  xaccl=float(accel.axis.x) ;
  yaccl= float(accel.axis.y);
  zaccl = float(accel.axis.z);
  totvect = sqrt(pow((xaccl-xavg), 2)+pow((yaccl - yavg),2) + pow((zaccl - zavg),2));
  
  //Average with previous step
  tot_av = (totvect + totvect_previous)/2;
  
  //Stock value as previous vector for next loop
  totvect_previous=totvect;

  char str[6];
  dtostrf(tot_av, 5, 2, str );
  
  //// QUESTION 21 ////
  Serial3.println(str);
  Serial.println(str);
  
  //// QUESTION 20 ////
  oled.print(str);
  oled.print("\n");

  

  //Detection of earthquake (assuming earthquake occurs when values are higher than 100)
  /*if(tot_av>100){
    if (flag == 0){
      steps++;
      flag =1;
    }
    flag++;
  }
  else if(tot_av<=100){
      flag = 0;
  }*/
      

  delay(100); // keep the loop at 10Hz
}




void calibrate()
{
  //// QUESTION 19 ////
  //Read accelerometer data from sensor
  accel.readXYZ();

  //Store first 100 values read
  for (int i=0; i<100; i++){
    x= x +  float(accel.axis.x);
    y= y +float(accel.axis.y);
    z= z + float(accel.axis.z);
  }

  //Calculate and save the averages for each axis 
  xavg = x/100;
  delay(100);
  yavg = y/100;
  delay(100);
  zavg = z/100;

  //Insert a delay 
  delay(100);
  
  //Print the averages on the serial monitor
  Serial.print(String(xavg)+";");
  Serial.print(String(yavg)+";");
  Serial.print(String(zavg)+";");
  Serial.print("\n");
}
