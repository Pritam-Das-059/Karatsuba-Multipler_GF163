`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 16:41:36
// Design Name: 
// Module Name: karatsuba41
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
// where a(x),b(x) are 41-bit binary numbers 

module karatsuba41(
    input [40:0] a,
    input [40:0] b,
    output [80:0] c
    );
 wire[20:0] al,ah, bl, bh;
 wire[40:0] p1, p2, p3, t;
 wire[82:0] c1;
 assign ah = {1'b0,a[40:21]};
 assign al = a[20:0];
 assign bh = {1'b0,b[40:21]};
 assign bl = b[20:0];
 
 karatsuba21 ks211(al,bl,p1);
 karatsuba21 ks212(ah,bh,p3);
 karatsuba21 ks213(al^ah,bl^bh,p2);
 
 assign t = p2^p1^p3;
 assign c1 = {p3,{42{1'b0}}}^{{21{1'b0}},t,{21{1'b0}}}^{{42{1'b0}},p1};
 assign c = c1[80:0];
endmodule
