`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 14:07:39
// Design Name: 
// Module Name: karatsuba3
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
// where a(x),b(x) are 3-bit binary numbers
 

module karatsuba3(
    input [2:0] a,
    input [2:0] b,
    output [4:0] c
    );
  
 wire[1:0] al,ah, bl, bh;
 wire[2:0] p1, p2, p3, t;
 wire[6:0] c1;
 assign ah = {1'b0,a[2]};
 assign al = a[1:0];
 assign bh = {1'b0,b[2]};
 assign bl = b[1:0];
 
 karatsuba2 ks21(al,bl,p1);
 karatsuba2 ks22(ah,bh,p3);
 karatsuba2 ks23(al^ah,bl^bh,p2);
 
 assign t = p2^p1^p3;
 assign c1 = {p3,4'b0000}^{2'b00,t,2'b00}^{4'b0000,p1};
 assign c = c1[4:0];
  
     
endmodule
