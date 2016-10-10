/*
 * Exercise: 3
 * Description: 4 bit comparator in always block
 * Script:
iverilog -o comparator comparator.v comparator-tb.v
vvp comparator
gtkwave comparator.vpd
 */
module comp4 (R,A,B);
	input [3:0] A, B;
	output [3:0] R;
	reg [3:0] R;
	wire temp;
	
	assign temp= Z;
	
	always @(*)
	begin
		if(A > B)
			R[2] = 1;
		else
			R[2] = 0;
		if(A == B)
			R[1] = 1;
		else
			R[1] = 0;
		if(A < B)
			R[0] = 1;
		else
			R[0] = 0;
		R[3] <= temp;
	end
endmodule