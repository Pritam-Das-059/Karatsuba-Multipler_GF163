`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 12:34:02
// Design Name: 
// Module Name: karatsuba2
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

// This module calculates c(x) = a(x)*b(x) using Karatsuba's Multiplication Technique
// where a(x),b(x) belongs to G.F(2^2) 
 

module karatsuba2(
    input [1:0] a,
    input [1:0] b,
    output reg [2:0] c
    );
    

always @(a,b)
  begin 
      c[0] = a[0] & b[0]; // p1 = ah * bh 
      c[2] = a[1] & b[1]; // p3 = al * bl
      c[1] = ((a[0]^a[1])&(b[0]^b[1]))^c[0]^c[2]; // t = (ah^al)*(bh^bl)^p1*p3
  end     
    
endmodule
