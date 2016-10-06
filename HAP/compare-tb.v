/*
 * Project: Harvard Architecture Processor
 * Module: Compare Instruction
 * Script:
iverilog cmp compare.v compare-tb.v
vvp cmp
gtkwave compare.vpd
 */
 module compare-tb;
	reg [4:0] opcode;
	reg [2:0] R1, R2;
	wire [2:0] RD;
	
	compare UUT (RD, opcode, R1, R2);
	
	initial Clk = 0; 
    always #2 Clk = ~Clk;
	
	initial
	begin
		$dumpfile("compare.vpd");
		$dumpvars;
			
			#5
		$finish;
	end
endmodule