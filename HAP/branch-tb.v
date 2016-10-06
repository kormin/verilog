/*
 * Project: Harvard Architecture Processor
 * Module: Branch Instruction
 * Format: 
 OOOO - O111 - MMMM - MMMM
 OOOO - O111 - MMMM - MMMM
 OOOO - O111 - xxxx - x222
 OOOO - O111 - xxxx - x222
 OOOO - Oxxx - MMMM - MMMM
 OOOO - Oxxx - xxxx - x111
 * Legend: 
 * OOOOO = 5-bit Opcode
 * 111 = register 1 (R1)
 * 222 = register 2 (R2)
 * MMMM - MMMM = 8-bit Memory Address
 * Script:
iverilog -o brn branch.v branch-tb.v
vvp brn
gtkwave branch.vpd
 */
 module tb_branch;
	// reg clk;
	reg [15:0] data;
	reg [7:0] NPC;
	wire [7:0] PC;
	
	branch UUT (data, NPC, PC);
	
	// initial clk = 0; 
    // always #2 clk = ~clk;
	
	initial
	begin
		$dumpfile("branch.vpd");
		$dumpvars;
/*
 * Legend: 
 * OOOOO = 5-bit Opcode
 * 111 = register 1 (R1)
 * 222 = register 2 (R2)
 * MMMM - MMMM = 8-bit Memory Address
R1 = 6; M = 213; R2/R1 = 5;
110 1101 0101;
11011010101;
R1 = 0; M = 213
000 1101 0101;
00011010101;
 */
			NPC = 8'd9;
			// BNE - Branch if Not Equal
			// OOOO - O111 - MMMM - MMMM
			// Test Case: R1 != 0
			// data = 16'b10011
			data = 16'b1001111011010101;
			#5
			// Test Case: R1 == 0
			// data = 16'b10011
			data = 16'b1001100011010101;
			#5
			// BE - Branch if Equal
			// OOOO - O111 - MMMM - MMMM
			// Test Case: R1 != 0
			// data = 16'b10100
			data = 16'b1010011011010101;
			#5
			// Test Case: R1 == 0
			// data = 16'b10100
			data = 16'b1010000011010101;
			#5
			// BNER - Branch to Address in Register if Not Equal
			// OOOO - O111 - xxxx - x222
			// Test Case: R1 != 0
			// data = 16'b10101
			data = 16'b1010111011010101;
			#5
			// Test Case: R1 == 0
			// data = 16'b10101
			data = 16'b1010100011010101;
			#5
			// BER - Branch if Equal
			// OOOO - O111 - xxxx - x222
			// Test Case: R1 != 0
			// data = 16'b10110
			data = 16'b1011011011010101;
			#5
			// Test Case: R1 == 0
			// data = 16'b10110
			data = 16'b1011000011010101;
			#5
			// J - Jump
			// OOOO - Oxxx - MMMM - MMMM
			// data = 16'b10111
			data = 16'b1011100011010101;
			#5
			// JR - Jump to Address in Register
			// OOOO - Oxxx - xxxx - x111
			// data = 16'b11000
			data = 16'b1100000011010101;
			#5
			data = 16'd0;
			#5
		$finish;
	end
endmodule