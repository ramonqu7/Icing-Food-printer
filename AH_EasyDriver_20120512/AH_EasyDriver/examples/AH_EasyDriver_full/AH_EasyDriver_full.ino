
/********************************************************
** Download from:                                      **
** http://www.alhin.de/arduino/index.php?n=44          **
********************************************************/

#include <AH_EasyDriver.h>

//AH_EasyDriver(int RES, int DIR, int STEP, int MS1, int MS2, int SLP, int ENABLE, int RST);
AH_EasyDriver stepper(200,2,3,4,5,6,7,8);   // init with all functions

//AH_EasyDriver(int RES, int DIR, int STEP, int MS1, int MS2, int SLP);
//AH_EasyDriver stepper(200,2,3,4,5,6);    // init w/o "enable" and "reset" functions


void setup() {
  stepper.resetDriver();                  // reset driver
  stepper.enableDriver();                 // enable driver 
  stepper.setMicrostepping(3);            // 0 -> Full Step                                
                                          // 1 -> 1/2 microstepping
                                          // 2 -> 1/4 microstepping
                                          // 3 -> 1/8 microstepping
  stepper.setSpeedRPM(100);               // set speed in RPM, rotations per minute
//  stepper.setSpeedHz(100);              // set speed in Hz
}

void loop() {
  
  stepper.sleepOFF();                     // set Sleep mode OFF
    stepper.move(1000);                   // move 1000 steps
//  stepper.move(1000,FORWARD);
  stepper.sleepON();                      // set Sleep mode ON  
  delay(1000);

  stepper.sleepOFF();                     // set Sleep mode OFF
    stepper.move(-1000);                  // move -1000 steps
//  stepper.move(1000,BACKWARD);
  stepper.sleepON();                      // set Sleep mode ON  
  delay(1000); 
  
  stepper.sleepOFF();                     // set Sleep mode OFF
    stepper.revolve(1.5);                 // revolve 1.5 times
  stepper.sleepON();                      // set Sleep mode ON  
  delay(1000); 
  
  stepper.sleepOFF();                     // set Sleep mode OFF
    stepper.rotate(359.9);                // rotate 359.9°
  stepper.sleepON();                      // set Sleep mode ON  
  delay(1000); 

}


