/*
 * Author: 
 * Project: Harvard Architecture Processor
 * Module: Compare and Branching Instruction
 * Script:
iverilog -o cmp compare.v compare-tb.v
vvp cmp
gtkwave compare.vpd
 */
module cmpBrnch (out, inp1, inp2, mode)
	input [7:0] inp1, inp2;
	input [2:0] mode;
	output [7:0] out;
	
	parameter Yes  = 7'b1;
	parameter No   = 7'b0;
	parameter LT   = 3'b000;
	parameter GT   = 3'b001;
	parameter EQ   = 3'b010;
	parameter GTE  = 3'b011;
	parameter LTE  = 3'b100;
	parameter NE   = 3'b101;
	parameter BNE  = 3'b111;
	parameter BE   = 3'b110;
	parameter BNER = 3'b111;
	parameter BER  = 3'b110;
	parameter J    = 3'b;
	parameter JR   = 3'b;
endmodule