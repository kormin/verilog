/*
 * Exercise: 4
 * Description: Accumulator
 * Comments:
 * Script:
iverilog -o accum5 accum5.v accum5-tb.v accumulator.v shifter.v alushifter.v alu.v comparator.v fulladder.v fouradder.v subtractor.v
vvp accum5
gtkwave accum5.vpd
 */
module accum5 (Res,Of,A,B,Cin,Mode, Clk, nReset);
	input [3:0] A, B;
	input Cin, Clk, nReset;
	input [3:0] Mode;
	
	output [3:0] Res;
	output Of;
	
	wire [3:0] Res1, Res2;
	wire [3:0] temp_1, temp_2;
	wire overflow, of1, of2;
	
	//alu4 AL0 (temp_1,overflow,A,B,Cin,Mode[2:0]);
	//shifter SH0 (temp_2,A,Mode[2:0]);
	//assign Res1 = (Mode[3] == 1) ? temp_2 : temp_1;
	//assign of1 = (Mode[3] == 1) ? 1'bZ : overflow ;
	alushifter ALU0 (Res1,of1,A,B,Cin,Mode);
	accum Acc(Res, Of, {Res1,of1}, Clk, nReset);
	//assign Res = Res2;
	//assign Of = of2;
endmodule