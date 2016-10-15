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
	
endmodule