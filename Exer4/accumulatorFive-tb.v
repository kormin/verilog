module tb_accum5;
	reg [4:0] A;
	reg Clk, nReset;
	
	wire CBF;
	wire [3:0] Y;
	
	initial
	begin
		$dumpfile("accum5.vpd");
		$dumpvars;
		$finish;
	end
endmodule