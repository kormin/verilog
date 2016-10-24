module tb_shifter;
	reg	[3:0] a;
	reg	[2:0] m;
	wire [3:0] r;
	
	shifter UUT(r, a, m);
	
	initial
	begin
		$dumpfile("shifter.vpd");
		$dumpvars;
		// shift left add 0
		a = 4'b1111; m = 3'b000; 
		#10
		a = 4'b1010;  m = 3'b000; 
		#10
		a = 4'b0111;  m = 3'b000; 
		#10
		// shift left add 1
		a = 4'b1111;  m = 3'b001; 
		#10
		a = 4'b1010;  m = 3'b001; 
		#10
		a = 4'b0111;  m = 3'b001; 
		#10
		// shift right add 0
		a = 4'b1001;  m = 3'b010; 
		#10
		a = 4'b1010;  m = 3'b010; 
		#10
		a = 4'b0111;  m = 3'b010; 
		#10
		// shift right add 1
		a = 4'b1001;  m = 3'b011; 
		#10
		a = 4'b1010;  m = 3'b011; 
		#10
		a = 4'b0111;  m = 3'b011; 
		#10
		// shift left arithmetic
		a = 4'b1001;  m = 3'b100; 
		#10
		a = 4'b1010;  m = 3'b100; 
		#10
		a = 4'b0111;  m = 3'b100; 
		#10
		// shift right arithmetic
		a = 4'b1001;  m = 3'b101; 
		#10
		a = 4'b1010;  m = 3'b101; 
		#10
		a = 4'b0111;  m = 3'b101; 
		#10
		// rotate left
		a = 4'b1001;  m = 3'b110; 
		#10
		a = 4'b1010;  m = 3'b110; 
		#10
		a = 4'b0111;  m = 3'b110; 
		#10
		// rotate right
		a = 4'b1001;  m = 3'b111; 
		#10
		a = 4'b1010;  m = 3'b111; 
		#10
		a = 4'b0111;  m = 3'b111;
		#10
		$finish; 
	end
endmodule