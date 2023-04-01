`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 16:05:47
// Design Name: 
// Module Name: karatsuba11
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
// where a(x),b(x) are 11-bit binary numbers
 
module karatsuba11(
    input [10:0] a,
    input [10:0] b,
    output [20:0] c
    );
 wire[5:0] al,ah, bl, bh;
 wire[10:0] p1, p2, p3, t;
 wire[22:0] c1;
 assign ah = {1'b0,a[10:6]};
 assign al = a[5:0];
 assign bh = {1'b0,b[10:6]};
 assign bl = b[5:0];
 
 karatsuba6 ks61(al,bl,p1);
 karatsuba6 ks62(ah,bh,p3);
 karatsuba6 ks63(al^ah,bl^bh,p2);
 
 assign t = p2^p1^p3;
 assign c1 = {p3,{12{1'b0}}}^{{6{1'b0}},t,{6{1'b0}}}^{{12{1'b0}},p1};
 assign c = c1[20:0];
endmodule
