module tb_alu4;
	reg	[3:0] a, b;
	reg	[2:0] m;
	wire [3:0] r;
	wire of;
	reg cin;
	
	alu4 UUT(r, of, a, b, cin, m);
	
	initial
	begin
		$dumpfile("alu.vpd");
		$dumpvars;
		//add
		a = 4'b1111; b = 4'b0001; m = 3'b000; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 3'b000; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 3'b000; cin=0;
		#10
		//subtract
		a = 4'b1111; b = 4'b1001; m = 3'b001; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 3'b001; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 3'b001; cin=0;
		#10
		//compare
		a = 4'b1001; b = 4'b0001; m = 3'b010; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 3'b010; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 3'b010; cin=0;
		#10
		//and
		a = 4'b1001; b = 4'b0001; m = 3'b011; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 3'b011; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 3'b011; cin=0;
		#10
		//or
		a = 4'b1001; b = 4'b0001; m = 3'b100; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 3'b100; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 3'b100; cin=0;
		#10
		//complement
		a = 4'b1001; b = 4'b0001; m = 3'b101; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 3'b101; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 3'b101; cin=0;
		#10
		//increment
		a = 4'b1001; b = 4'b0001; m = 3'b110; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 3'b110; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 3'b110; cin=0;
		#10
		//decrement
		a = 4'b1001; b = 4'b0001; m = 3'b111; cin=0;
		#10
		a = 4'b1010; b = 4'b0101; m = 3'b111; cin=0;
		#10
		a = 4'b0111; b = 4'b1100; m = 3'b111; cin=0;
		#10
		$finish;
	end
endmodule