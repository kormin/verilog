module tb_halfadder;
	reg a,b;
	wire d,e;
	halfadder UUT(.S(d), .C(e), .x(a), .y(b));
	initial
		begin
			$dumpfile("halfadder.vpd");
			$dumpvars;
			a=0; b=0;
			#10
			a=0; b=0;
			#10
			a=0; b=1;
			#10
			a=0; b=1;
			#10
			a=1; b=0;
			#10
			a=1; b=0;
			#10
			a=1; b=1;
			#10
			a=1; b=1;
			#10
		$finish;
	end
endmodule