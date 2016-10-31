module tb_accum;
	reg [4:0] A;
	reg Clk, nReset;
	
	wire CBF;
	wire [3:0] Y;
	
	initial
	begin
		$dumpfile("accumulator.vpd");
		$dumpvars;
		$finish;
	end
endmodule