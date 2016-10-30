/*
 * Exercise: 4
 * Description: Accumulator
 * Comments:
 * Script:
iverilog -o accumulator accumulator.v accumulator-tb.v
vvp accumulator
gtkwave accumulator.vpd
 */
module accum (Y, CBF, A, Clk, nReset);
	input [4:0] A;
	input Clk, nReset;
	
	output CBF;
	output [3:0] Y;
	reg [3:0] Y;
	reg CBF;
	
	
	input [3:0] As, B;
	input Cin;
	input [3:0] Mode;
	wire Of;
	// assign Y = alushifter as1(Res,Of,As,B,Cin,Mode);
	
	always @ (negedge Clk or negedge nReset)
	begin
		if(!nReset)
			Y<=5'd0;
		else
			begin
			Y<=A[4:1];
			CBF<=A[0];
			end
	end
endmodule
