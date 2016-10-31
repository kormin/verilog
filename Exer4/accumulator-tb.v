/*
 * Exercise: 4
 * Description: Accumulator
 * Comments:
 * Script:
iverilog -o accumulator accumulator.v accumulator-tb.v
vvp accumulator
gtkwave accumulator.vpd
 */
module tb_accum;
	reg [4:0] A;
	reg Clk, nReset;
	
	wire CBF;
	wire [3:0] Y;
	
	accum UUT (Y, CBF, A, Clk, nReset);
	
	initial Clk = 0; 
    always #2 Clk = ~Clk;
	
	initial
	begin
		$dumpfile("accumulator.vpd");
		$dumpvars;
			nReset=1;
			A = 5'b00001;
			#3
			A = 5'b10001;
			#3
			A = 5'b11001;
			#3
			A = 5'b11001;
			#3
			A = 5'b11101;
			nReset = 0;
			#4
			nReset=1;
			A = 5'b11001;
			#2
			A = 5'b11111;
			nReset = 0;
			#4
			A = 5'b11001;
			#2
			
		$finish;
	end
endmodule