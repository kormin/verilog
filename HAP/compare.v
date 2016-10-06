/*
 * Project: Harvard Architecture Processor
 * Module: Compare Instruction
 * Script:
iverilog cmp compare.v compare-tb.v
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
	
	always @ (opcode) begin
		case(opcode)
			LT: 
				if(R1 < R2)
					Rd <= Yes;
				else
					Rd <= No;
			GT: 
				if(R1 > R2)
					Rd <= Yes;
				else
					Rd <= No;
			EQ: 
				if(R1 == R2)
					Rd <= Yes;
				else
					Rd <= No;
			GTE: 
				if(R1 >= R2)
					Rd <= Yes;
				else
					Rd <= No;
			LTE: 
				if(R1 <= R2)
					Rd <= Yes;
				else
					Rd <= No;
			NE: 
				if(R1 != R2)
					Rd <= Yes;
				else
					Rd <= No;
			default: RD <= No;
		endcase
	end
	
endmodule
