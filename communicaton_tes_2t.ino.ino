
#include <AH_EasyDriver.h>
#include <Servo.h>
float px, py;  // location

// speeds
Servo myservo;
long step_delay;  // machine version

// settings
char mode_abs=1;  // absolute mode?

AH_EasyDriver stepper1(200,2,3);  
AH_EasyDriver stepper2(200,8,9);  

#define MIN_STEP_DELAY (50.0)

/**
 * First thing this machine does on startup.  Runs only once.
 */
void setup() {
  stepper1.sleepOFF(); 
  stepper2.sleepOFF();
  pinMode(13,OUTPUT);
  stepper1.resetDriver();
  stepper2.enableDriver();
  stepper1.setMicrostepping(3);
  stepper2.setMicrostepping(3);
// Change motor speed///////////////
   stepper1.setSpeedRPM(35);
   stepper2.setSpeedRPM(35);
//////////////////////////////
  Serial.begin(115200);  // open coms
  Serial.setTimeout(100);
  
  px=0;
  py=0;
  pre();

}

void pre(){
bool canprint = true;
while (canprint){
while (Serial.available()<1){}
  String s = Serial.readStringUntil('\n');
  if (s.charAt(s.length()-2) == 'S'){
    canprint = true;
    servomove(String(s.charAt(s.length()-1)));
  }else{
    canprint = false;
  }
}
}


void servomove(String s){
  Serial.print(s);
  if (s.charAt(0) == 'L'){

    if (!myservo.attached()){
  myservo.attach(11);
  }
  myservo.write(110);
  delay(700);
  myservo.detach();
  Serial.println("Load DONE");
  }
  if (s.charAt(0) == 'R'){
     if (!myservo.attached()){
  myservo.attach(11);
  }
  myservo.write(82);
  delay(6000);
  myservo.detach();
  Serial.println("Reload DONE");
  }
  
  


  
}

void loop() {
  // listen for serial commands
while (Serial.available()<1){} // Keep waiting if receiving any input get out of the loop

  String s = Serial.readStringUntil('\n'); // Store input
  Serial.print(s);
  Serial.print(" ");
  
  char c = s.charAt(0);

  if (c=='C'){
       c = s.charAt(1);
       Serial.print(c);
       Serial.print(" ");

      if (c =='H'){
           Home();
           

           
           Serial.println("DONE");
       }else if(c =='S'){
        String timer = s.substring(2);
          long servoTime = timer.toInt();
          Serial.print(servoTime);
          Start(servoTime);
          Serial.println("DONE");
      }else if (c=='T'){
          Stop();
          Serial.println("DONE");
       }else if(c=='E'){
          Home();
          String timer = s.substring(2);
          long servoTime = timer.toInt();
          Serial.print(servoTime);
          servoBack(servoTime);

          Serial.println(" DONE");
          stepper1.sleepON(); 
          stepper2.sleepON();
        }

    }else if(c=='P'){
        s= s.substring(1);
        Point(s);
      }


}

void servoBack( long servotime){
if (!myservo.attached()){
  myservo.attach(11);
  }
  myservo.write(84);
  Serial.print("Go back");
  delay(servotime);
  myservo.detach();
}

void Start(long sp)
{
  digitalWrite(13,HIGH);
  if (!myservo.attached()){
  myservo.attach(11);
  }
  myservo.write(sp);// Implement pen down or squeeze
  delay(700);
  Serial.print("Start ");
}



void Stop()
{
  digitalWrite(13,LOW);
  myservo.write(84);
  delay(500);
  myservo.detach();
  // Implement code to make pen up or stop squeezing bottle
  //Servo movement
  delay(1000);
  Serial.print("Stop ");
}

void Home()
{
// Move stepmotor to come back from current point back (0,0);
///////
line(0,0);
Serial.print("Home ");
}



void Point(String s){
 
int SplitIndex = s.indexOf(",");
String x =s.substring(0,SplitIndex);
float Nx = x.toFloat();
Nx *=2;
String y =s.substring(SplitIndex+1);
float Ny = y.toFloat();

/*
Nx/=53;
Ny/=53;
*/

if((Nx>=0)&&(Ny>=0)){
   /////
   Serial.print("Go TO line ");
   line(Nx,Ny);
    Serial.println("DONE");
    
}

}





/**
 * delay for the appropriate number of microseconds
 * @input ms how many milliseconds to wait
 */
void pause(long ms) {
  delay(ms/1000);
  delayMicroseconds(ms%1000);  // delayMicroseconds doesn't work for values > ~16k.
}




/**
 * Set the logical position
 * @input npx new position x
 * @input npy new position y
 */
void position(float npx,float npy) {
  // here is a good place to add sanity tests
  px=npx;
  py=npy;
}


/**
 * Uses bresenham's line algorithm to move both motors
 * @input newx the destination x position
 * @input newy the destination y position
 **/
void line(float newx,float newy) {
  float dx=newx-px;
  float dy=newy-py;



  int dirx=dx>0?1:-1;
  int diry=dy>0?1:-1;  // because the motors are mounted in opposite directions
  dx=abs(dx);
  dy=abs(dy);
  
 if (dx>1){
   px=newx;
 }
 if (dy>1){
  py=newy;
 }
float radius=.2425; //radius of gear in inches
float dxn = dx/ 2/3.1415/radius/53*1600;
float dyn = dy/2/3.1415/radius/53*1600;
dx = (long)dxn;
dy = (long)dyn;


  long i;
  long over=0;

  if(dx>dy) {
    for(i=0;i<dx;++i) {
      stepper1.move(dirx);
      over+=dy;
      if(over>=dx) {
        over-=dx;
        stepper2.move(diry);
      }
      pause(step_delay);
    }
  } else {
    for(i=0;i<dy;++i) {
      stepper2.move(diry);
      over+=dx;
      if(over>=dy) {
        over-=dy;
        stepper1.move(dirx);
      }
      pause(step_delay);
    }
  }
  
 

  Serial.print("Move TO ");
    Serial.print(px);
    Serial.print(" ");
    Serial.print(py);
    Serial.print(" ");
  
  
 
  
}







