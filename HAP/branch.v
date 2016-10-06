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
module branch (data, NPC, PC);
	input [15:0] data;
	input [7:0] NPC;
	output [7:0] PC;
	
	// state encoding
	parameter Yes  = 3'b1;
	parameter No   = 3'b0;
	parameter BNE  = 5'b10011;
	parameter BE   = 5'b10100;
	parameter BNER = 5'b10101;
	parameter BER  = 5'b10110;
	parameter J    = 5'b10111;
	parameter JR   = 5'b11000;
	
	reg [7:0] M;
	reg [4:0] opcode;
	reg [2:0] R1, R2;
	reg [7:0] PC;
	always @ (data) begin
		opcode <= data[15:11];
		// R1 <= data[10:8];
		// R2 <= data[2:0];
		// M <= data[7:0];
	end
	always @ (data or opcode) begin
		case(opcode)
			BNE: begin
				R1 <= data[10:8];
				M <= data[7:0];
			end
			BE: begin
				R1 <= data[10:8];
				M <= data[7:0];
			end
			BNER: begin
				R1 <= data[10:8];
				R2 <= data[2:0];
			end
			BER: begin
				R1 <= data[10:8];
				R2 <= data[2:0];
			end
			J: begin
				M <= data[7:0];
			end
			JR: begin
				R1 <= data[2:0];
			end
		endcase
	end
	always @ (opcode or R1 or R2 or M) begin
		case(opcode)
			BNE: begin
				// R1 <= data[10:8];
				// M <= data[7:0];
				if(R1 != No)
					PC <= M;
				else
					PC <= NPC;
			end
			BE: begin
				// R1 <= data[10:8];
				// M <= data[7:0];
				if(R1 == No)
					PC <= M;
				else
					PC <= NPC;
			end
			BNER: begin
				// R1 <= data[10:8];
				// R2 <= data[2:0];
				if(R1 != No)
					PC <= R2;
				else
					PC <= NPC;
			end
			BER: begin
				// R1 <= data[10:8];
				// R2 <= data[2:0];
				if(R1 == No)
					PC <= R2;
				else
					PC <= NPC;
			end
			J: begin
				// M <= data[7:0];
				PC <= M;
			end
			JR: begin
				// R1 <= data[10:8];
				PC <= R1;
			end
			default: PC <= No;
		endcase
	end
	
endmodule
