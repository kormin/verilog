module tb_accum5;
	// reg [4:0] A;
	reg Clk, nReset;
	
	// wire CBF;
	// wire [3:0] Y;
	
	reg	[3:0] a, b, m;
	reg cin;
	wire [3:0] r;
	wire of;
	
	accum5 UUT (r, of, a, b, cin, m, Clk, nReset);
	
	initial Clk = 0; 
    always #2 Clk = ~Clk;
	
	initial
	begin
		$dumpfile("accum5.vpd");
		$dumpvars;
			nReset=1;
			a = 4'b1111; b = 4'b0001; m = 4'b0000; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0000; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0000; cin=0;
			#5
			//subtract
			a = 4'b1111; b = 4'b1001; m = 4'b0001; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0001; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0001; cin=0;
			#5
		$finish;
	end
endmodule