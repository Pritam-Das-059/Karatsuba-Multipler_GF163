`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 15:48:45
// Design Name: 
// Module Name: karatsuba6
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
// where a(x),b(x) are 6-bit binary numbers
 
module karatsuba6(
    input [5:0] a,
    input [5:0] b,
    input [10:0] c
    );
 wire[2:0] al,ah, bl, bh;
 wire[4:0] p1, p2, p3, t;
 assign ah = a[5:3];
 assign al = a[2:0];
 assign bh = b[5:3];
 assign bl = b[2:0];
 
 karatsuba3 ks31(al,bl,p1);
 karatsuba3 ks33(ah,bh,p3);
 karatsuba3 ks32(al^ah,bl^bh,p2);
 
 assign t = p2^p1^p3;
 assign c = {p3,{6{1'b0}}}^{3'b000,t,3'b000}^{{6{1'b0}},p1};   
    
endmodule
