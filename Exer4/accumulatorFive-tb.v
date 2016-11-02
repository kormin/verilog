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
		$finish;
	end
endmodule