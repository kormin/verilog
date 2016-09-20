module tb_faddr;
	reg a,b,c;
	wire d,e;
	faddr UUT(.S(d), .C(e), .X(a), .Y(b), .Z(c));
	initial
		begin
			$dumpfile("Ex1a.vpd");
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