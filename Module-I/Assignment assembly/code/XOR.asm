
;logical  XOR operation
;output displayed using 7447 & Seven segment
 
.include "/sdcard/nikhil/m328Pdef.inc"
 

 ldi r16, 0b00111100 ;identifying output pins 2,3,4,5
 out DDRD,r16  ;declaring pins as output
 

 ldi r16,0b00000001 ;
 ldi r17,0b00000001 ;
 

 eor r16,r17 ; XOR contents of r16,r17 & store in r16
 

 ldi r20, 0b00000010 ;counter = 2
 

 rcall loopw  ;calling the loopw routine
 

 out PORTD,r16  ;writing output to pins 2,3,4,5
 

 Start:
 rjmp Start
 
 ;loop for bit shifting
 loopw: lsl r16   ;left shift
  dec r20   ;
  brne loopw ;if counter != 0
  ret
