module tb_fulladder;
	reg a,b,c;
	wire d,e;
	faddr UUT(.S(d), .C(e), .X(a), .Y(b), .Z(c));
	initial
		begin
			$dumpfile("fulladder.vpd");
			$dumpvars;
			a=0; b=0; c=0;
			#10
			a=0; b=0; c=1;
			#10
			a=0; b=1; c=0;
			#10
			a=0; b=1; c=1;
			#10
			a=1; b=0; c=0;
			#10
			a=1; b=0; c=1;
			#10
			a=1; b=1; c=0;
			#10
			a=1; b=1; c=1;
			#10
		$finish;
	end
endmodule