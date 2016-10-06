/*
 * Project: Harvard Architecture Processor
 * Module: Compare Instruction
 * Script:
iverilog -o cmp compare.v compare-tb.v
vvp cmp
gtkwave compare.vpd
 */
module compare (RD, opcode, R1, R2);
	input [4:0] opcode;
	input [2:0] R1, R2;
	output [2:0] RD;
	
	// state encoding
	parameter Yes = 1'b1;
	parameter No  = 1'b0;
	parameter LT  = 5'b01011;
	parameter GT  = 5'b01100;
	parameter EQ  = 5'b01101;
	parameter GTE = 5'b01110;
	parameter LTE = 5'b01111;
	parameter NE  = 5'b10000;
	
	reg [2:0] RD;
	always @ (opcode or R1 or R2) begin
		case(opcode)
			LT: begin
				if(R1 < R2)
					RD <= Yes;
				else
					RD <= No;
			end
			GT: begin
				if(R1 > R2)
					RD <= Yes;
				else
					RD <= No;
			end
			EQ: begin
				if(R1 == R2)
					RD <= Yes;
				else
					RD <= No;
			end
			GTE: begin
				if(R1 >= R2)
					RD <= Yes;
				else
					RD <= No;
			end
			LTE: begin
				if(R1 <= R2)
					RD <= Yes;
				else
					RD <= No;
			end
			NE: begin
				if(R1 != R2)
					RD <= Yes;
				else
					RD <= No;
			end
			default: RD <= No;
		endcase
	end
	
endmodule
