/*
 * Exercise: 2
 * Description: Multiplexer 4 to 1
 * Script:
iverilog -o mux mux.v mux-tb.v
vvp mux
gtkwave mux.vpd
 */
module mux41 (Y,A,B,C,D,S);
	input [3:0] A, B, C, D;
	input [1:0] S;
	output [3:0] Y;
	
	assign Y = S[1] ? (S[0] ? D : C) : (S[0] ? B : A);

endmodule