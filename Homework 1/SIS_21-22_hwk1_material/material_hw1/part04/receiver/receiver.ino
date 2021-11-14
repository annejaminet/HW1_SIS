

void setup() {

  //Initialize serial line to communicate with the computer
  Serial.begin(9600);
  while(!Serial){

  }

  //Initialize serial line to communicate with the Xbee
  Serial3.begin(9600);

  //Change Arduino PAN ID (Used in the lab to ensure that people do not broadcast to their neighbours)
   // Flush serial line
   Serial3.flush();
    delay(1500);
    //Activate AT command mode
    Serial3.print("+++");
    Serial3.flush();
    delay(1500);
    // Change ID (can be any number between 0 and 0xFFFF)
    // Substitute the number 2019 with the number of your computer in the computer room. This will allow you to
    // create your unique network for wireless communication.
    Serial3.print("ATID 10§\r");
    Serial3.print("ATCN\r"); //ExitCommandmode

  //clear serial buffer
  while(Serial3.available()){Serial3.read();}

}

void loop() {

  // Read from Xbee serial line, write to computer Serial line
  while(Serial3.available() > 0)
  {

   Serial.write(Serial3.read());
  }

}
