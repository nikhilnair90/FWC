#include <WiFi.h>
#include <WiFiUdp.h>
#include <ArduinoOTA.h>

#ifndef STASSID
#define STASSID "Galaxy S21 FE 5G5554"  // Replace with your network credentials
#define STAPSK  "acif5658"
#endif

const char* ssid = STASSID;
const char* password = STAPSK;



void OTAsetup() 
{
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
 while (WiFi.waitForConnectResult() != WL_CONNECTED) {
    delay(5000);
    ESP.restart();
  }
  ArduinoOTA.begin();
}

void OTAloop() {
  ArduinoOTA.handle();
}

//-------------------------------------------------------//

int A,B=0,C=0,D=0,P,Q,a,b,c,d,e,f,g;
void sevenseg(int a,int b,int c,int d,int e,int f,int g);


void setup(){
  OTAsetup();

pinMode(34, INPUT);
pinMode(35, INPUT);
pinMode(12, OUTPUT);  
pinMode(13, OUTPUT);
pinMode(14, OUTPUT);
pinMode(15, OUTPUT);
pinMode(16, OUTPUT);
pinMode(17, OUTPUT);
pinMode(18, OUTPUT); 

}

void loop() {
  OTAloop();
  delay(10); 
 
  P = digitalRead(34);
  Q = digitalRead(35);
  //P = 0;
  //Q = 1;
  A = (P&!Q)|(!P&Q) ;  
 
  a=(!D&!C&!B&A)|(!D&C&!B&!A);
  b=(!D&C&!B&A)|(!D&C&B&!A);
  c=(!D&!C&B&!A);
  d=(!D&!C&!B&A)|(!D&C&!B&!A)|(!D&C&B&A);
  e=(!D&!C&!B&A)|(!D&!C&B&A)|(!D&C&!B&!A)|(!D&C&!B&A)|(!D&C&B&A)|(D&!C&!B&A);
  f=(!D&!C&!B&A)|(!D&!C&B&!A)|(!D&!C&B&A)|(!D&C&B&A);
  g=(!D&!C&!B&!A)|(!D&!C&!B&A)|(!D&C&B&A);
     
  sevenseg(a,b,c,d,e,f,g); 

}

//To drive the display
void sevenseg(int a,int b,int c,int d,int e,int f,int g)
 {
   digitalWrite(12, a); 
   digitalWrite(13, b); 
   digitalWrite(14, c); 
   digitalWrite(15, d); 
   digitalWrite(16, e); 
   digitalWrite(17, f);     
   digitalWrite(18, g); 
 }
