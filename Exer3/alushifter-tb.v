/*
 * Exercise: 3
 * Description: ALU Shifter
 * Comments:
 Uses Exer1, Exer2 and Exer3
 comp4.v in Exer2
 * Script:
iverilog -o alushifter faddr.v fouraddr.v subt.v comp4.v mux41.v alu4.v shifter.v alushifter.v alushifter-tb.v
vvp alushifter
gtkwave alushifter.vpd
 */
module tb_alushifter4;
	reg	[3:0] a, b, m;
	reg cin;
	wire [3:0] r;
	wire of;
	
	alushifter UUT(r, of, a, b, cin, m);
	
	initial
	begin
		$dumpfile("alushifter.vpd");
		$dumpvars;
		//add
		a = 4'b1111; b = 4'b0001; m = 4'b0000; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 4'b0000; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 4'b0000; cin=0;
		#10
		//subtract
		a = 4'b1111; b = 4'b1001; m = 4'b0001; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 4'b0001; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 4'b0001; cin=0;
		#10
		//compare
		a = 4'b1001; b = 4'b0001; m = 4'b0010; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 4'b0010; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 4'b0010; cin=0;
		#10
		//and
		a = 4'b1001; b = 4'b0001; m = 4'b0011; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 4'b0011; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 4'b0011; cin=0;
		#10
		//or
		a = 4'b1001; b = 4'b0001; m = 4'b0100; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 4'b0100; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 4'b0100; cin=0;
		#10
		//complement
		a = 4'b1001; b = 4'b0001; m = 4'b0101; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 4'b0101; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 4'b0101; cin=0;
		#10
		//increment
		a = 4'b1001; b = 4'b0001; m = 4'b0110; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 4'b0110; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 4'b0110; cin=0;
		#10
		//decrement
		a = 4'b1001; b = 4'b0001; m = 4'b0111; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 4'b0111; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 4'b0111; cin=0;
		#10
		// shift left add 0
		a = 4'b1111; b = 4'b0001; m = 4'b1000; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 4'b1000; cin=0;
		#10
		a = 4'b0111; b = 4'b0000; m = 4'b1000; cin=0;
		#10
		// shift left add 1
		a = 4'b1111; b = 4'b0000; m = 4'b1001; cin=0;
		#10
		a = 4'b1010; b = 4'b0000; m = 4'b1001; cin=0;
		#10
		a = 4'b0111; b = 4'b0000; m = 4'b1001; cin=0;
		#10
		// shift right add 0
		a = 4'b1001; b = 4'b0000; m = 4'b1010; cin=0;
		#10
		a = 4'b1010; b = 4'b0000; m = 4'b1010; cin=0;
		#10
		a = 4'b0111; b = 4'b0000; m = 4'b1010; cin=0;
		#10
		// shift right add 1
		a = 4'b1001; b = 4'b0000; m = 4'b1011; cin=0;
		#10
		a = 4'b1010; b = 4'b0000; m = 4'b1011; cin=0;
		#10
		a = 4'b0111; b = 4'b0000; m = 4'b1011; cin=0;
		#10
		// shift left arithmetic
		a = 4'b1001; b = 4'b0000; m = 4'b1100; cin=0;
		#10
		a = 4'b1010; b = 4'b0000; m = 4'b1100; cin=0;
		#10
		a = 4'b0111; b = 4'b0000; m = 4'b1100; cin=0;
		#10
		// shift right arithmetic
		a = 4'b1001; b = 4'b0000; m = 4'b1101; cin=0;
		#10
		a = 4'b1010; b = 4'b0000; m = 4'b1101; cin=0;
		#10
		a = 4'b0111; b = 4'b0000; m = 4'b1101; cin=0;
		#10
		// rotate left
		a = 4'b1001; b = 4'b0000; m = 4'b1110; cin=0;
		#10
		a = 4'b1010; b = 4'b0000; m = 4'b1110; cin=0;
		#10
		a = 4'b0111; b = 4'b0000; m = 4'b1110; cin=0;
		#10
		// rotate right
		a = 4'b1001; b = 4'b0000; m = 4'b1111; cin=0;
		#10
		a = 4'b1010; b = 4'b0000; m = 4'b1111; cin=0;
		#10
		a = 4'b0111; b = 4'b0000; m = 4'b1111; cin=0;
		#10
		$finish;
	end
endmodule