// Testbench for MULx



module MULxtest;
  reg [7:0] V, c;
  wire [7:0] mulx_out;
  MULx DUT (V, c, mulx_out);

  initial begin
    $monitor("t=%2d,V=%h,c=%h,mulx_out=%h",$time,V,c,mulx_out);

    V = 8'h63; c = 8'h1B;
    #10 V = 8'h96; c = 8'h1B;
    #5  $finish;
  end

endmodule