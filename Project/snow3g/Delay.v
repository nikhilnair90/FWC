//`timescale 1ns / 1ps
// Delay module

module Delay(
    input [31:0] D,
    input clk,
    output reg [31:0] Q
);
    
  always @(posedge clk) begin
      Q = D; 
    end 
endmodule 