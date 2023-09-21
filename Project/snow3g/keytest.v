// Testbench for Initialize


module keystreamtest;
  reg clk,rst;
  reg [127:0] k,IV;
  wire [511:0] LFSR_out;
  wire [95:0] FSM_out, z;
  

  Keystream DUT (k,IV,clk,rst,LFSR_out,FSM_out, z );
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("Keystream.vcd");
    $dumpvars(0,keystreamtest);
    $monitor("t=%2d,FSM_out=%h,LFSR_out=%h,z=%h",$time,FSM_out,LFSR_out,z);
    
    rst = 1'b1;
    clk = 1'b1;
    
    // Input key & initialization variable

    //k = {32'h4881ff48, 32'h952c4910, 32'h82c5b300, 32'h2bd6459f};
    
    //IV = {32'h1c0bf45f, 32'hdf1f9b25, 32'had5c4d84, 32'hea024714};
    
    k = {32'h140e0f76, 32'h3352255a, 32'h109cf92e, 32'h0ded7263};
    
    IV = {32'h7fdcc233, 32'h1befd79f, 32'h41a7c4c9, 32'h6b68079a};

    #7 rst = 1'b0;
   
    
    
    #360 $finish;
  end


endmodule




/*
LFSR_S[0] = LFSR_S[1];
      LFSR_S[1] = LFSR_S[2];
      LFSR_S[2] = LFSR_S[3];
      LFSR_S[3] = LFSR_S[4];
      LFSR_S[4] = LFSR_S[5];
      LFSR_S[5] = LFSR_S[6];
      LFSR_S[6] = LFSR_S[7];
      LFSR_S[7] = LFSR_S[8];
      LFSR_S[8] = LFSR_S[9];
      LFSR_S[9] = LFSR_S[10];
      LFSR_S[10] = LFSR_S[11];
      LFSR_S[11] = LFSR_S[12];
      LFSR_S[12] = LFSR_S[13];
      LFSR_S[13] = LFSR_S[14];
      LFSR_S[14] = LFSR_S[15];
      LFSR_S[15] = v_1;

      */