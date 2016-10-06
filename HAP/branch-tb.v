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
 module branch-tb;
	reg clk;
	reg [4:0] opcode;
	reg [2:0] R1, R2;
	wire [2:0] RD;
	
	branch UUT (data, NPC, PC);
	
	initial clk = 0; 
    always #2 clk = ~clk;
	
	initial
	begin
		$dumpfile("branch.vpd");
		$dumpvars;
			
			#5
		$finish;
	end
endmodule