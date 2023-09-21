// Testbench for ClockFSM



module clkfsmtest;
  reg clk,rst;
  wire [31:0] F;
  wire [95:0] FSM_out;
  reg [511:0]LFSR_S;
  reg [127:0] k, IV;

  ClockFSM DUT (clk, rst,LFSR_S, F, FSM_out);

  always #5 clk = ~clk;
  
  initial begin
    
    $dumpfile("ClockFSM.vcd");
    $dumpvars(0,clkfsmtest);
    $monitor("t=%2d,F=%h,FSM=%h",$time,F,FSM_out);
    
    rst = 1'b1;
    clk = 1'b1;
    
    k = {32'h4881ff48, 32'h952c4910, 32'h82c5b300, 32'h2bd6459f};
    
    IV = {32'h1c0bf45f, 32'hdf1f9b25, 32'had5c4d84, 32'hea024714};
    
    LFSR_S = {k[127:96] ^ IV[31:0],
          k[95:64],
          k[63:32],
          k[31:0] ^ IV[63:32],
          k[127:96] ^ 32'hffffffff,
          k[95:64] ^ 32'hffffffff ^ IV[95:64],
          k[63:32] ^ 32'hffffffff ^ IV[127:96],
          k[31:0] ^ 32'hffffffff,
          k[127:96],
          k[95:64],
          k[63:32],
          k[31:0],
          k[127:96] ^ 32'hffffffff,
          k[95:64] ^ 32'hffffffff,
          k[63:32] ^ 32'hffffffff,
          k[31:0] ^ 32'hffffffff};
    #7 rst = 1'b0;
   
    
    
    #10 $finish;
  end


endmodule