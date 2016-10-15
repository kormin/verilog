/*
 * Author: 
 * Project: Harvard Architecture Processor
 * Module: Compare and Branching Instruction
 * Script:
iverilog -o cmpBrnch CompareBranch.v CompareBranch-tb.v
vvp cmpBrnch
gtkwave cmpBrnch.vpd
 */
module cmpBrnch (out, mode, R1, R2);
	input [7:0] R1, R2;
	input [2:0] mode;
	output [7:0] out;
	
	parameter Yes  = 1'd1;
	parameter No   = 1'd0;
	parameter AllNo = 8'd0;
	parameter LT   = 3'b000;
	parameter GT   = 3'b001;
	parameter EQ   = 3'b010;
	parameter GTE  = 3'b011;
	parameter LTE  = 3'b100;
	parameter NE   = 3'b101;
	parameter BE   = 3'b110;
	parameter BER  = 3'b110;
	parameter BNE  = 3'b111;
	parameter BNER = 3'b111;
	// parameter J    = 3'b;
	// parameter JR   = 3'b;
	
	reg [7:0] out;
	always @ (mode or R1 or R2) begin
		out [7:1] <= 6'd0;
		case(mode)
			// Compare
			LT   : out [0] <= (R1  < R2) ? Yes : No;
			GT   : out [0] <= (R1  > R2) ? Yes : No;
			EQ   : out [0] <= (R1 == R2) ? Yes : No;
			GTE  : out [0] <= (R1 >= R2) ? Yes : No;
			LTE  : out [0] <= (R1 <= R2) ? Yes : No;
			NE   : out [0] <= (R1 != R2) ? Yes : No;
			// Branching
			BE   : out [0] <= (R1 == AllNo) ? Yes : No;
			BER  : out [0] <= (R1 == AllNo) ? Yes : No;
			BNE  : out [0] <= (R1 != AllNo) ? Yes : No;
			BNER : out [0] <= (R1 != AllNo) ? Yes : No;
			// J    : out [0] <= Yes;
			// JR   : out [0] <= R1;
			// default: out [0] <= No;
		endcase
	end
endmodule