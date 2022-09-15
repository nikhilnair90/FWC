//Declaring all variables as integers
#include<Arduino.h>
int Q=0,P=0;
int D,C,B,F;

//Code released under GNU GPL.  Free to use for anything.
void disp_7447(int F)
{
  digitalWrite(2, F); //LSB
  digitalWrite(3, B); 
  digitalWrite(4, C); 
  digitalWrite(5, D); //MSB

}
// the setup function runs once when you press reset or power the board
void setup() {
    pinMode(2, OUTPUT);  
    pinMode(3, OUTPUT);
    pinMode(4, OUTPUT);
    pinMode(5, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
  F=(P&&!Q)||(!P&&Q);
  //B=0;
  //C=0;
  //D =0 ;
  
disp_7447(F);  
}
//&& is the AND operation
// || is the OR operation
// ! is the NOT operation
