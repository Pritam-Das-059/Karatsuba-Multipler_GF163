`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.03.2023 20:34:07
// Design Name: 
// Module Name: karatsuba163
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


// This module calculates c(x) = a(x)*b(x), where a(x),b(x) belongs to G.F(2^163) using Karatsuba's Multiplication Technique 
//irreducible polynomial for the field is x^163+x^80+x^47+x^9+1.

module karatsuba163(
    input [162:0] a,
    input [162:0] b,
    output [162:0] c
    );

 wire[81:0] al,ah, bl, bh;   //a = ah*2^82 + al , b = bh*2^82 + bl 
 
 wire[162:0] p1, p2, p3, t;  // p1 = ah*al, p3 = bh*bl, p2 = (ah^al)*(bh*bl), t = P1^p2^p2
 
 wire[326:0] c1;  // Result of multiplication before reducing 
 
 assign ah = {1'b0,a[162:82]}; // '0' is added at MSB to make ah 82 bit
 assign al = a[81:0];
 assign bh = {1'b0,b[162:82]}; // '0' is added at MSB to make bh 82 bit
 assign bl = b[81:0];
 
 // Three 82-bit Karatsuba Multiplier blocks are used to calculate three product terms
 karatsuba82 ks821(al,bl,p1);
 karatsuba82 ks822(ah,bh,p3);
 karatsuba82 ks823(al^ah,bl^bh,p2);
 
 assign t = p2^p1^p3;
 
 //Product terms are padded with '0's accordingly
 assign c1 = {p3,{164{1'b0}}}^{{82{1'b0}},t,{82{1'b0}}}^{{164{1'b0}},p1};
 
 //Polynomial reduction is applied using given irreducible polynomial 
 //x^163+x^80+x^47+x^9+1
 poly_reduc pr1(c1,c);
  
endmodule
