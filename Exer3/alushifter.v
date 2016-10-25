// iverilog -o Ex3c Ex2c.v Ex2b.v Ex2a.v Ex1a.v Ex1b.v Ex1c.v Ex3b.v Ex3c.v Ex3c-tb.v
module alushifter (Res,Of,A,B,Cin,Mode);
	input [3:0] A, B;
	input Cin;
	input [3:0] Mode;
	output [3:0] Res;
	output Of;
	
	wire [3:0] temp_1, temp_2;
	wire overflow;
	
	alu4 AL0 (temp_1,overflow,A,B,Cin,Mode[2:0]);
	shifter SH0 (temp_2,A,Mode[2:0]);
	assign Res = (Mode[3] == 1) ? temp_2 : temp_1;
	assign Of = (Mode[3] == 1) ? 1'bZ : overflow ;
	
	// always @ (*)
	// begin
		// case (Mode[3])
			// 1'b0: 
			// begin
				// Res <= temp_2;
				// Of <= 1'bZ;
			// end
			// 1'b1: Res <= temp_1;
		// endcase
	// end
	
	// if(Mode[3])
	// begin
		// assign Res = temp_2;
		// assign Of = 1'bZ;
	// end
	// else begin
		// assign Res = temp_1;
	// end
	
endmodule