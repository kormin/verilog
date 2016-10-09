/*
 * Exercise: 2
 * Description: 4 bit ALU
 * Script:
iverilog -o alu alu.v mux.v comparator.v fulladder.v fouradder.v subtractor.v alu-tb.v
vvp alu
gtkwave alu.vpd
 */
module alu4 (Res,Of,A,B,Cin,Mode);
	input [3:0] A, B;
	input Cin;
	input [2:0] Mode;
	output [3:0] Res;
	output Of;
	
	wire [3:0] wres;
	wire [3:0] temp_1, temp_2, temp_3, temp_4, temp_5, temp_6, temp_7, temp_8;
	wire [3:0] temp_mux1, temp_mux2;
	wire [1:0] temp_out;
	wire temp_s, Cout, Bout;
	wire wof;
	
	fouraddr f1(temp_1, temp_out[0], A, B, Cin);
	subt 	  s1(temp_2, temp_out[1], A, B);
	comp4    c1(temp_3, A, B);
	assign temp_4 = (A & B);
	assign temp_5 = (A | B);
	assign temp_6 = (~A);
	assign temp_7 = (A+1);
	assign temp_8 = (A-1); 
	mux41    m1(temp_mux1, temp_1, temp_2, temp_3, temp_4, Mode[1:0]);
	mux41    m2(temp_mux2, temp_5, temp_6, temp_7, temp_8, Mode[1:0]);
	mux41    m3(Res, temp_mux1, temp_mux2, temp_mux1, temp_mux2, {1'b0, Mode[2]});
	assign temp_s = (Mode[2]| Mode[1]);
	assign Of = (Mode==1'd0) ? temp_out[0] : ( (Mode==1'd1) ? temp_out[1] : 1'bZ);
endmodule