/*
 * Project: Harvard Architecture Processor
 * Module: Branch Instruction
Format: 
OOOO - O111 - MMMM - MMMM
OOOO - O111 - MMMM - MMMM
OOOO - O111 - xxxx - x222
OOOO - O111 - xxxx - x222
OOOO - Oxxx - MMMM - MMMM
OOOO - Oxxx - xxxx - x111
Legend: 
OOOOO = 5-bit Opcode
111 = register 1 (R1)
222 = register 2 (R2)
MMMM - MMMM = 8-bit Memory Address
x - Don't care
 * Script:
iverilog -o brn branch.v branch-tb.v
vvp brn
gtkwave branch.vpd
 */
module tb_branch;
	reg [15:0] data;
	reg [7:0] NPC;
	wire [7:0] PC;
	branch UUT (data, NPC, PC);
	initial
	begin
		$dumpfile("branch.vpd");
		$dumpvars;
			NPC = 8'd9; data = 16'b1001111011010101; #5
			data = 16'b1001100011010101; #5
			data = 16'b1010011011010101; #5
			data = 16'b1010000011010101; #5
			data = 16'b1010111011010101; #5
			data = 16'b1010100011010101; #5
			data = 16'b1011011011010101; #5
			data = 16'b1011000011010101; #5
			data = 16'b1011100011010101; #5
			data = 16'b1100000011010101; #5
			data = 16'd0; #5
		$finish;
	end
endmodule