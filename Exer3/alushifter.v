/*
 * Exercise: 3
 * Description: ALU Shifter
 * Comments:
 Uses Exer1, Exer2 and Exer3
 comp4.v in Exer2
 * Script:
iverilog -o alushifter faddr.v fouraddr.v subt.v comp4.v mux41.v alu4.v shifter.v alushifter.v alushifter-tb.v
vvp alushifter
gtkwave alushifter.vpd
 */
module alushifter (Res, Of, A, B, Cin, Mode);
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
endmodule