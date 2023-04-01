`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 17:26:20
// Design Name: 
// Module Name: km163_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module km163_test(

    );
 reg [162:0] a;
 reg [162:0] b;
 wire [162:0] c;
  
  karatsuba163 dut(a,b,c);
  initial
  
  begin
  
  #5;  
  a = 163'h8000000000000000000000000000000000000001;
  b = 163'h8000000000000000000000000000000000000001;
  #10;   
  a = 163'h810000000000000000000000000000000000001;
  b = 163'h820000000000000000000000000000000000001;
  #10;  
  a = 163'h7ffffffffffffffffffffffffffffffffffffffff;
  b = 163'h7ffffffffffffffffffffffffffffffffffffffff;
  end 
endmodule
