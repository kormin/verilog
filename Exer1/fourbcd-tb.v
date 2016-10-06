/*
 * Exercise: 1
 * Description: 4 bit bcd test bench
 * Script:
iverilog fourbcd fourbcd.v fourbcd-tb.v halfadder.v fulladder.v
vvp fourbcd
gtkwave fourbcd.vpd
 */
 module tb_fourbcd;
	reg [3:0] a, b;
	wire [7:0] c;
	
	fourbcd UUT(.S(c), .A(a), .B(b));
	
	initial
		begin
			$dumpfile("fourbcd.vpd");
			$dumpvars;
			
			a = 4'd0;
			b = 4'd0;
			#10
			a = 4'd1;
			b = 4'd1;
			#10
			a = 4'd2;
			b = 4'd2;
			#10
			a = 4'd3;
			b = 4'd3;
			#10
			a = 4'd4;
			b = 4'd4;
			#10
			a = 4'd5;
			b = 4'd5;
			#10
			a = 4'd6;
			b = 4'd6;
			#10
			a = 4'd7;
			b = 4'd7;
			#10
			a = 4'd8;
			b = 4'd8;
			#10
			a = 4'd9;
			b = 4'd9;
			#10
			a = 4'd10;
			b = 4'd10;
			#10
			a = 4'd11;
			b = 4'd11;
			#10
			a = 4'd12;
			b = 4'd12;
			#10
			a = 4'd13;
			b = 4'd13;
			#10
			a = 4'd14;
			b = 4'd14;
			#10
			a = 4'd15;
			b = 4'd15;
			#10
			a = 4'd9;
			b = 4'd11;
			#10
			a = 4'd12;
			b = 4'd11;
			#10
			a = 4'd5;
			b = 4'd3;
			#10
			a = 4'd1;
			b = 4'd1;
			#10
			a = 4'd2;
			b = 4'd1;
			#10
			a = 4'd4;
			b = 4'd1;
			#10
			a = 4'd8;
			b = 4'd1;
			#10
			a = 4'd4;
			b = 4'd4;
			#10
			a = 4'd8;
			b = 4'd4;
			#10
			a = 4'd8;
			b = 4'd8;
			#10
			a = 4'd1;
			b = 4'd1;
			#10
			b = 4'd2;
			a = 4'd1;
			#10
			b = 4'd4;
			a = 4'd1;
			#10
			b = 4'd8;
			a = 4'd1;
			#10
			a = 4'd0;
			b = 4'd11;
			#10
			a = 4'd13;
			b = 4'd0;
			#10
			
		$finish;
	end
endmodule