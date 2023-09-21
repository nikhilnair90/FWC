// Testbench for Sbox



module Sboxtest;
  reg clk;
  reg [31:0] w;
  wire [31:0] s1_out;
  wire [31:0] s2_out;

  S1 DUT1 (w,clk,s1_out);
  //S2 DUT2 (w,clk,s2_out);

  always #5 clk = ~clk;

  initial begin
    $dumpfile("S1.vcd");
    $dumpvars(0,Sboxtest);
    $monitor("t=%2d,w=%h,s1_out=%h",$time,w,s1_out);
    //$monitor("t=%2d,w=%h,s2_out=%h",$time,w,s2_out);
    
    clk = 1'b0;
        w=32'hE19FCF13;
    #10 w=32'h084B14B4;
    
    #40  $finish;
  end


endmodule