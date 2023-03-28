`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 16:22:05
// Design Name: 
// Module Name: karatsuba21
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
// where a(x),b(x) are 21-bit binary numbers
 
module karatsuba21(
    input [20:0] a,
    input [20:0] b,
    output [40:0] c
    );
 wire[10:0] al,ah, bl, bh;
 wire[20:0] p1, p2, p3, t;
 wire[42:0] c1;
 assign ah = {1'b0,a[20:11]};
 assign al = a[10:0];
 assign bh = {1'b0,b[20:11]};
 assign bl = b[10:0];
 
 karatsuba11 ks111(al,bl,p1);
 karatsuba11 ks112(ah,bh,p3);
 karatsuba11 ks113(al^ah,bl^bh,p2);
 
 assign t = p2^p1^p3;
 assign c1 = {p3,{22{1'b0}}}^{{11{1'b0}},t,{11{1'b0}}}^{{22{1'b0}},p1};
 assign c = c1[40:0];
endmodule
