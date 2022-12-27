//Executes logic of XOR gate and displays on Seven segment
#include <avr/io.h>

int main (void)
{
		
 //set pin 2,3,4,5  of arduino as output
  DDRD    |=0b00111100 ;

  while (1) {
    
    PORTD |= 0b00000100;
    PORTD ^= 0b00000100;

  }

  return 0;

}
