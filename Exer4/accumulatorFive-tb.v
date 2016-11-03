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
			//compare
			a = 4'b1001; b = 4'b0001; m = 4'b0010; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0010; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0010; cin=0;
			#5
			//and
			a = 4'b1001; b = 4'b0001; m = 4'b0011; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0011; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0011; cin=0;
			#5
			//or
			a = 4'b1001; b = 4'b0001; m = 4'b0100; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0100; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0100; cin=0;
			#5
			//complement
			a = 4'b1001; b = 4'b0001; m = 4'b0101; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0101; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0101; cin=0;
			#5
			//increment
			a = 4'b1001; b = 4'b0001; m = 4'b0110; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0110; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0110; cin=0;
			#5
			//decrement
			a = 4'b1001; b = 4'b0001; m = 4'b0111; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0111; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0111; cin=0;
			#5
			// shift left add 0
			a = 4'b1111; b = 4'b0001; m = 4'b1000; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b1000; cin=0;
			#5
			a = 4'b0111; b = 4'b0000; m = 4'b1000; cin=0;
			#5
			// shift left add 1
			a = 4'b1111; b = 4'b0000; m = 4'b1001; cin=0;
			#5
			a = 4'b1010; b = 4'b0000; m = 4'b1001; cin=0;
			#5
			a = 4'b0111; b = 4'b0000; m = 4'b1001; cin=0;
			#5
			// shift right add 0
			a = 4'b1001; b = 4'b0000; m = 4'b1010; cin=0;
			#5
			a = 4'b1010; b = 4'b0000; m = 4'b1010; cin=0;
			#5
			a = 4'b0111; b = 4'b0000; m = 4'b1010; cin=0;
			#5
			// shift right add 1
			a = 4'b1001; b = 4'b0000; m = 4'b1011; cin=0;
			#5
			a = 4'b1010; b = 4'b0000; m = 4'b1011; cin=0;
			#5
			a = 4'b0111; b = 4'b0000; m = 4'b1011; cin=0;
			#5
			// shift left arithmetic
			a = 4'b1001; b = 4'b0000; m = 4'b1100; cin=0;
			#5
			a = 4'b1010; b = 4'b0000; m = 4'b1100; cin=0;
			#5
			a = 4'b0111; b = 4'b0000; m = 4'b1100; cin=0;
			#5
			// shift right arithmetic
			a = 4'b1001; b = 4'b0000; m = 4'b1101; cin=0;
			#5
			a = 4'b1010; b = 4'b0000; m = 4'b1101; cin=0;
			#5
			a = 4'b0111; b = 4'b0000; m = 4'b1101; cin=0;
			#5
			// rotate left
			a = 4'b1001; b = 4'b0000; m = 4'b1110; cin=0;
			#5
			a = 4'b1010; b = 4'b0000; m = 4'b1110; cin=0;
			#5
			a = 4'b0111; b = 4'b0000; m = 4'b1110; cin=0;
			#5
			// rotate right
			a = 4'b1001; b = 4'b0000; m = 4'b1111; cin=0;
			#5
			a = 4'b1010; b = 4'b0000; m = 4'b1111; cin=0;
			#5
			a = 4'b0111; b = 4'b0000; m = 4'b1111; cin=0;
			#5
			nReset=0;
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
			//compare
			a = 4'b1001; b = 4'b0001; m = 4'b0010; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0010; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0010; cin=0;
			#5
			//and
			a = 4'b1001; b = 4'b0001; m = 4'b0011; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0011; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0011; cin=0;
			#5
			//or
			a = 4'b1001; b = 4'b0001; m = 4'b0100; cin=0;
			#5
			a = 4'b1010; b = 4'b0101; m = 4'b0100; cin=0;
			#5
			a = 4'b0111; b = 4'b1100; m = 4'b0100; cin=0;
			#5
		$finish;
	end
endmodule