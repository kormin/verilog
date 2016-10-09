/*
 * Exercise: 2
 * Description: 4 bit comparator
 * Script:
iverilog -o comparator comparator.v comparator-tb.v
vvp comparator
gtkwave comparator.vpd
 */
module tb_comp4;
	reg [3:0] a, b;
	wire [3:0] r;
	comp4 UUT(r,a,b);
	initial
		begin
			$dumpfile("comparator.vpd");
			$dumpvars;
			a = 4'd3;
			b = 4'd10;
			#10
			a = 4'd15;
			b = 4'd14;
			#10
			a = 4'd5;
			b = 4'd1;
			#10
			a = 4'd8;
			b = 4'd5;
			#10
			a = 4'd14;
			b = 4'd3;
			#10
			a = 4'd11;
			b = 4'd15;
			#10
			a = 4'd12;
			b = 4'd3;
			#10
			a = 4'd15;
			b = 4'd15;
			#10
			a = 4'd1;
			b = 4'd1;
			#10
			a = 4'd5;
			b = 4'd9;
			#10
		$finish;
	end
endmodule