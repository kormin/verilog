/*
 * Project: Harvard Architecture Processor
 * Module: Branch Instruction
 * Script:
iverilog brn branch.v branch-tb.v
vvp brn
gtkwave branch.vpd
 */
module branch (PC, opcode, M, NPC, R1, R2);
	input [4:0] opcode;
	input [2:0] R1, R2;
	input M, NPC;
	output PC;
	
	// state encoding
	parameter Yes  = 1'b1;
	parameter No   = 1'b0;
	parameter BNE  = 5'b10011;
	parameter BE   = 5'b10100;
	parameter BNER = 5'b10101;
	parameter BER  = 5'b10110;
	parameter J    = 5'b10111;
	parameter JR   = 5'b11000;
	
	always @ (opcode) begin	
		case(opcode)
			BNE: 
				if(R1 != No)
					PC <= M;
				else
					PC <= NPC;
			BE: 
				if(R1 != No)
					PC <= M;
				else
					PC <= NPC;
			BNER: 
				if(R1 != No)
					PC <= R2;
				else
					PC <= NPC;
			BER: 
				if(R1 != No)
					PC <= R2;
				else
					PC <= NPC;
			J:  PC <= M;
			JR: PC <= R1;
			default: PC <= No;
		endcase
	end
	
endmodule
