`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.04.2026 09:20:14
// Design Name: 
// Module Name: LUT
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


module LUT(
   input a_i,
   input b_i,
   input c_i,
   input d_i,
   input e_i,
   input f_i,
   output parityBit_o
);

LUTparity even_parity(parityBit_o, a_i, b_i, c_i, d_i, e_i, f_i);
   
endmodule

//Even Parity
primitive LUTparity(pBit_o, a_i, b_i, c_i, d_i, e_i, f_i);
input a_i, b_i, c_i, d_i, e_i, f_i;
output pBit_o;

table
//some combinations are missing like 101100, 111010 etc. so that self checker in testbench throw errors
// a b c d e f: p
   0 0 0 0 0 0: 0;

   0 0 0 0 0 1: 1;
   0 0 0 0 1 0: 1;
   0 0 0 1 0 0: 1;
   0 0 1 0 0 0: 1;
   0 1 0 0 0 0: 1;
   1 0 0 0 0 0: 1;
   
   0 0 0 0 1 1: 0;
   0 0 0 1 0 1: 0;
   0 0 1 0 0 1: 0;
   0 1 0 0 0 1: 0;
   1 0 0 0 0 1: 0;
   0 0 0 1 1 0: 0;
   0 0 1 0 1 0: 0;
   0 1 0 0 1 0: 0;
   1 0 0 0 1 0: 0;
   0 0 1 1 0 0: 0;
   0 1 0 1 0 0: 0;
   1 0 0 1 0 0: 0;
   0 1 1 0 0 0: 0;
   1 0 1 0 0 0: 0;
   1 1 0 0 0 0: 0;

   0 0 0 1 1 1: 1;
   0 0 1 0 1 1: 1;
   0 1 0 0 1 1: 1;
   1 0 0 0 1 1: 1;
   0 0 1 1 1 0: 1;
   0 1 0 1 1 0: 1;
   1 0 0 1 1 0: 1;
   0 0 1 1 0 1: 1;
   0 1 0 1 0 1: 1;
   1 0 0 1 0 1: 1;
   1 1 0 0 0 1: 1;
   0 1 1 0 0 1: 1;
   1 1 0 1 0 0: 1;
   0 1 1 1 0 0: 1;
   1 1 0 0 1 0: 1;
   0 1 1 0 1 0: 1;
   1 1 1 0 0 0: 1;

   0 0 1 1 1 1: 0;
   0 1 0 1 1 1: 0;
   1 0 0 1 1 1: 0;
   0 1 1 0 1 1: 0;
   1 0 1 0 1 1: 0;
   0 1 1 1 0 1: 0;
   1 0 1 1 0 1: 0;
   0 1 1 1 1 0: 0;
   1 0 1 1 1 0: 0;
   1 1 0 0 1 1: 0;
   1 1 1 0 0 1: 0;
   1 1 1 1 0 0: 0;
   1 1 0 1 1 0: 0;

   0 1 1 1 1 1: 1;
   1 0 1 1 1 1: 1;
   1 1 0 1 1 1: 1;
   1 1 1 0 1 1: 1;
   1 1 1 1 0 1: 1;
   1 1 1 1 1 0: 1;

   1 1 1 1 1 1: 0;
endtable //UPD for parity generator: for practice purpose only, not the best approach due to length and complexity of design code.

endprimitive


//Better approach for LUT parity generator
//module Lut(
//   input [5:0]a_i, 
//   output pBit
//);
//
//localparam [63:0]mem = 64'h6996966996696996; //local parameter as memory
//Comment: idk if this hex number is correct for this parity generator, iv'e asked ai for this number 
//Comment: since calculating manually or using binary will take time. And i'm just practicing verilog not implementing, so i'm not checking it.
//assign pBit = mem[a_i];
//
//endmodule