/*
 * Exercise: 1
 * Description: full adder
 * Script:
iverilog fulladder fulladder.v fulladder-tb.v
vvp fulladder
gtkwave fulladder.vpd
 */
module fulladder(S,C,X,Y,Z);
	input X, Y, Z;
	output S, C;
	wire w1, w2, w3, w4;
	
	xor U0 (w1,X,Y);
	and U1 (w2,X,Y);
	and U2 (w3,Y,Z);
	and U3 (w4,X,Z);
	xor U4 (S,w1,Z);
	or U5 (C,w2,w3,w4);
	
endmodule
