`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 16:46:00
// Design Name: 
// Module Name: karatsuba81
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
// where a(x),b(x) are 82-bit binary numbers 

module karatsuba82(
    input [81:0] a,
    input [81:0] b,
    output [162:0] c
    );
 wire[40:0] al,ah, bl, bh;
 wire[80:0] p1, p2, p3, t;

 assign ah = a[81:41];
 assign al = a[40:0];
 assign bh = b[81:41];
 assign bl = b[40:0];
 
 karatsuba41 ks411(al,bl,p1);
 karatsuba41 ks412(ah,bh,p3);
 karatsuba41 ks413(al^ah,bl^bh,p2);
 
 assign t = p2^p1^p3;
 assign c = {p3,{82{1'b0}}}^{{41{1'b0}},t,{41{1'b0}}}^{{82{1'b0}},p1}; 
 
    
endmodule
