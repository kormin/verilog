/*
 * Exercise: 2
 * Description: 4 bit comparator
 * Script:
iverilog comparator comparator.v comparator-tb.v
vvp comparator
gtkwave comparator.vpd
 */
module comp4 (R,A,B);
	input [3:0] A, B;
	output [3:0] R;
	
	assign R[3] = Z;
	assign R[2] = A > B;
	assign R[1] = A == B;
	assign R[0] = A < B;
endmodule