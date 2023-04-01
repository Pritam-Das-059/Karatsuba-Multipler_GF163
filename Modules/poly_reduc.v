`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 21:13:46
// Design Name: 
// Module Name: poly_reduc
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


//This module generates the 163-bit reduced polynomial from 
// a 325-bit input polynomial using the given irriducible polynomial
// p(x) = x^163 + x^80 + x^47 + x^9 + 1


module poly_reduc(  input [324:0] a,
                   output [162:0] y
    );
integer p1 = 163, p2 = 80, p3 = 47, p4 = 9, p5 = 0; // p1,p2,p3,p4,p5 consists all the power of co-efficients of irreducible polynomial

wire[162:0] al,ah,b,c,d, result[3:0];

assign al = a[162:0];      // part of a, that doesn't need reducing 
assign ah = {1'b0,a[324:163]}; // part of a with x^p > x^162 : part of a that need to be reduced

assign result[0]= al^ah^(ah<<p2)^(ah<<p3)^(ah<<p4); //after first step of reduction, i.e.- ah*1

assign b =  (ah>>(p1-p2)); // part of a such that x^p > x^162, produced by ah*x^80 , after first reduction

assign result[1] = result[0]^b^(b<<p2)^(b<<p3)^(b<<p4); // reduction of b

assign c = (ah>>(p1-p3)); // part of a such that x^p > x^162, produced by ah*x^47 , after first reduction
 
assign result[2] = result[1]^c^(c<<p2)^(c<<p3)^(c<<p4); // reduction of c

assign d = (ah>>(p1-p4)); // part of a such that x^p > x^162, produced by ah*x^9 , after first reduction  
                     
assign result[3] = result[2]^d^(d<<p2)^(d<<p3)^(d<<p4); // reduction of d

assign y = result[3] ;// the final polynomial reduced to G.F.(2^163) from G.F(2^325)      
    
endmodule
