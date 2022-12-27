
//declaring the blink module
module helloworldfpga(

input  wire W,
input  wire X,


output wire a,
output wire b,
output wire c,
output wire d,
output wire e,
output wire f,
output wire g

);


reg A,B,C,D;

always @(*)
begin

//XOR Gate
A = (W&!X)|(!W&X);
B = 0;
C = 0;
D = 0;

//Display Decoder

a=(!D&!C&!B&A)|(!D&C&!B&!A);
b=(!D&C&!B&A)|(!D&C&B&!A);
c=(!D&!C&B&!A);
d=(!D&!C&!B&A)|(!D&C&!B&!A)|(!D&C&B&A);
e=(!D&!C&!B&A)|(!D&!C&B&A)|(!D&C&!B&!A)|(!D&C&!B&A)|(!D&C&B&A)|(D&!C&!B&A);
f=(!D&!C&!B&A)|(!D&!C&B&!A)|(!D&!C&B&A)|(!D&C&B&A);
g=(!D&!C&!B&!A)|(!D&!C&!B&A)|(!D&C&B&A);

end
endmodule
//end of the module

