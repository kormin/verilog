// iverilog -o Ex4d Ex4d.v Ex4d-tb.v Ex4c.v Ex2c.v Ex2b.v Ex2a.v Ex1a.v Ex1b.v Ex1c.v Ex3b.v Ex3c.v
module accum5 (Res,Of,A,B,Cin,Mode, Clk, nReset);
	input [3:0] A, B;
	input Cin, Clk, nReset;
	input [3:0] Mode;
	
	output [3:0] Res;
	output Of;
	
	wire [3:0] Res1, Res2;
	wire [3:0] temp_1, temp_2;
	wire overflow, of1, of2;
	
endmodule