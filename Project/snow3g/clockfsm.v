/* Clocking FSM.
* Produces a 32-bit word F.
* Updates FSM registers R1, R2, R3.
*/

module ClockFSM (
    input clk,
    input reset,
    input [511:0]LFSR_S,
    output reg [31:0] F, 
    output [95:0] FSM_out
);

  integer i;
  //reg [31:0] LFSR_S [0:255];
  reg [31:0] FSM_R [0:2];
  wire [31:0] s_1_out, s_2_out;
  reg [31:0] r,temp;
  
  S1 S_1(.w(FSM_R[0]),.clk(clk),.s1_out(s_1_out));
  S2 S_2(.w(FSM_R[1]),.clk(clk),.s2_out(s_2_out));

  always @(posedge clk or posedge reset) begin

    if (reset)begin
      // Initializing FSM_R 
      FSM_R[0] = 32'h00000000;
      FSM_R[1] = 32'h00000000;
      FSM_R[2] = 32'h00000000;
      $display("t=%2d,FSM=%h,LFSR=%h",$time,FSM_R[0],LFSR_S);
      //F = 32'ha283b85c;
    end   
    
    else begin
      F = ( ( LFSR_S[511:480] + FSM_R[0] ) & 32'hffffffff ) ^ FSM_R[1] ;
      //F = ( ( LFSR_S[479:448] + FSM_R[0] ) & 32'hffffffff ) ^ FSM_R[1] ;
              //LFSR[14]
      r = ( FSM_R[1] + ( FSM_R[2] ^ LFSR_S[191:160] ) ) & 32'hffffffff ;
      FSM_R[2] = s_2_out;             //LFSR[5]
      FSM_R[1] = s_1_out;
      FSM_R[0] = r;
      temp = LFSR_S[191:160];
      
      $display("t=%2d,F=%h,lfsr5=%h",$time,F,temp); 
      
    end 
    
    
    $display("t=%2d,s1_out=%h,s2_out=%h",$time,s_1_out,s_2_out);
    
  
  end

  //assign F = ( ( LFSR_S[511:480] + FSM_R[0] ) & 32'hffffffff ) ^ FSM_R[1] ;
    
  assign FSM_out = {FSM_R[2],FSM_R[1],FSM_R[0]};

endmodule