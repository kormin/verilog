// iverilog -o Ex4c Ex4c.v Ex4c-tb.v
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
endmodule
