module MULx(
  input [7:0] V,               // V : 8-bit i/p
  input [7:0] c,               // c : 8-bit i/p
  input clk,
  output reg[7:0] mulx_out     // mulx_out : 8-bit o/p
);
  always @(*) begin
    if (V & 8'h80) begin                 //if V[7]=1
      mulx_out = ((V << 1) ^ c);
    end           
    else 
      mulx_out = (V << 1);
  end
endmodule