/********************************************************
** Download from:                                      **
** http://www.alhin.de/arduino/index.php?n=44          **
********************************************************/

#include <AH_EasyDriver.h>

//AH_EasyDriver(int RES, int DIR, int STEP, int MS1, int MS2, int SLP);
AH_EasyDriver stepper(200,2,3,4,5,6);    // init w/o "enable" and "reset" functions
int time1;
int time2;

void setup() {               
  stepper.sleepOFF(); 
  Serial.begin(57600);
  Serial.println(stepper.getVersion());
}

void loop() {
  
  stepper.setSpeedMax();

  Serial.println("Full Step rotate");
  stepper.setMicrostepping(0);  
  time1 = millis();
  stepper.rotate(360);
  time2 = millis();  
  Serial.print("max. Speed: ");  
  Serial.print(200*1000000/(time2-time1));
  Serial.println("Hz"); 
  delay(500);

  Serial.println("Half Step");
  stepper.setMicrostepping(1);  
  time1 = millis();
  stepper.rotate(360);
  time2 = millis();  
  Serial.print("max. Speed: ");  
  Serial.print(400*1000000/(time2-time1));
  Serial.println("Hz"); 
  delay(500);  

  Serial.println("Quarter Step");
  stepper.setMicrostepping(2);  
  time1 = millis();
  stepper.rotate(360);
  time2 = millis();  
  Serial.print("max. Speed: ");  
  Serial.print(800*1000000/(time2-time1));
  Serial.println("Hz"); 
  delay(500);  

  Serial.println("Eight Step");
  stepper.setMicrostepping(3);  
  time1 = millis();
  stepper.rotate(360);
  time2 = millis();  
  Serial.print("max. Speed: ");  
  Serial.print(1600*1000000/(time2-time1));
  Serial.println("Hz"); 
  delay(500);  
 
}


