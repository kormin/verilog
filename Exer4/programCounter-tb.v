/*
 * Exercise: 4
 * Description: Program Counter
 * Comments:
 * Script:
iverilog -o programCounter programCounter.v programCounter-tb.v
vvp programCounter
gtkwave programCounter.vpd
 */
module tb_progCntr;
	reg [7:0] A;
	reg Clk, nReset, CountEn, Load;
	wire [7:0] Y;
	
	progCntr UUT (Y, A, Clk, nReset, CountEn, Load);
	
	initial Clk = 0; 
    always #2 Clk = ~Clk;
	
	initial
	begin
		$dumpfile("programCounter.vpd");
		$dumpvars;
			A = 8'd1;
			nReset=1;
			CountEn=0;
			Load=0;
			#10
			nReset=0;
			Load=1;
			#3
			nReset=1;
			Load=0;
			CountEn=1;
			#10
			nReset=1;
			Load=0;
			CountEn=0;
			#10
			nReset=1;
			Load=0;
			CountEn=1;
			
			#30
			A = 8'd250;
			nReset=1;
			CountEn=0;
			Load=1;
			#3
			nReset=1;
			Load=0;
			CountEn=1;
			#50
		$finish;
	end
endmodule