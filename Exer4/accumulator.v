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
