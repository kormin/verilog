/*
 * Exercise: 1
 * Description: half adder
 * Script:
iverilog halfadder halfadder.v halfadder-tb.v
vvp halfadder
gtkwave halfadder.vpd
 */
module halfadder (S, C, x, y);
	input x,y;
	output S, C;
	
	xor X1(S, x, y);
	and A1(C, x, y);
endmodule
