/*
 * Author: 
 * Project: Harvard Architecture Processor
 * Module: Compare and Branching Instruction
 * Script:
iverilog -o cmpBrnch CompareBranch.v CompareBranch-tb.v
vvp cmpBrnch
gtkwave cmpBrnch.vpd
 */
module tb_cmpBrnch;
	reg [2:0] opcode;
	reg [7:0] R1, R2;
	wire [7:0] RD;
	cmpBrnch UUT (RD, opcode, R1, R2);
	initial
	begin
		$dumpfile("cmpBrnch.vpd");
		$dumpvars;
			// LT
			opcode = 3'b000; R1 = 8'd3; R2 = 8'd5; #5
			opcode = 3'b000; R1 = 8'd5; R2 = 8'd3; #5
			opcode = 3'b000; R1 = 8'd3; R2 = 8'd3; #5
			// GT
			opcode = 3'b001; R1 = 8'd7; R2 = 8'd3; #5
			opcode = 3'b001; R1 = 8'd3; R2 = 8'd7; #5
			opcode = 3'b001; R1 = 8'd7; R2 = 8'd7; #5
			// EQ
			opcode = 3'b010; R1 = 8'd2; R2 = 8'd2; #5
			opcode = 3'b010; R1 = 8'd1; R2 = 8'd6; #5
			// GTE
			opcode = 3'b011; R1 = 8'd6; R2 = 8'd1; #5
			opcode = 3'b011; R1 = 8'd4; R2 = 8'd4; #5
			opcode = 3'b011; R1 = 8'd2; R2 = 8'd4; #5
			// LTE
			opcode = 3'b100; R1 = 8'd2; R2 = 8'd6; #5
			opcode = 3'b100; R1 = 8'd7; R2 = 8'd7; #5
			opcode = 3'b100; R1 = 8'd7; R2 = 8'd3; #5
			// NE
			opcode = 3'b101; R1 = 8'd2; R2 = 8'd6; #5
			opcode = 3'b101; R1 = 8'd2; R2 = 8'd2; #5
			// BE & BER
			opcode = 3'b110; R1 = 8'd0; #5
			opcode = 3'b110; R1 = 8'd1; #5
			// BNE & BNER
			opcode = 3'b111; R1 = 8'd1; #5
			opcode = 3'b111; R1 = 8'd0; #5
		$finish;
	end
endmodule