/*
 * Project: Harvard Architecture Processor
 * Module: Compare Instruction
 * Script:
iverilog -o cmp compare.v compare-tb.v
vvp cmp
gtkwave compare.vpd
 */
 module tb_compare;
	// reg clk;
	reg [4:0] opcode;
	reg [2:0] R1, R2;
	wire [2:0] RD;
	
	compare UUT (RD, opcode, R1, R2);
	
	// initial clk = 0; 
    // always #2 clk = ~clk;
	
	initial
	begin
		$dumpfile("compare.vpd");
		$dumpvars;
			// LT
			opcode = 5'b01011;
			R1 = 3'd3;
			R2 = 3'd5;
			#5
			// LT
			opcode = 5'b01011;
			R1 = 3'd5;
			R2 = 3'd3;
			#5
			// LT
			opcode = 5'b01011;
			R1 = 3'd3;
			R2 = 3'd3;
			#5
			// GT
			opcode = 5'b01100;
			R1 = 3'd7;
			R2 = 3'd3;
			#5
			// GT
			opcode = 5'b01100;
			R1 = 3'd3;
			R2 = 3'd7;
			#5
			// GT
			opcode = 5'b01100;
			R1 = 3'd7;
			R2 = 3'd7;
			#5
			// EQ
			opcode = 5'b01101;
			R1 = 3'd2;
			R2 = 3'd2;
			#5
			// EQ
			opcode = 5'b01101;
			R1 = 3'd1;
			R2 = 3'd6;
			#5
			// GTE
			opcode = 5'b01110;
			R1 = 3'd6;
			R2 = 3'd1;
			#5
			// GTE
			opcode = 5'b01110;
			R1 = 3'd4;
			R2 = 3'd4;
			#5
			// GTE
			opcode = 5'b01110;
			R1 = 3'd2;
			R2 = 3'd4;
			#5
			// LTE
			opcode = 5'b01111;
			R1 = 3'd2;
			R2 = 3'd6;
			#5
			// LTE
			opcode = 5'b01111;
			R1 = 3'd7;
			R2 = 3'd7;
			#5
			// LTE
			opcode = 5'b01111;
			R1 = 3'd7;
			R2 = 3'd3;
			#5
			// NE
			opcode = 5'b10000;
			R1 = 3'd2;
			R2 = 3'd6;
			#5
			// NE
			opcode = 5'b10000;
			R1 = 3'd2;
			R2 = 3'd2;
			#5
		$finish;
	end
endmodule