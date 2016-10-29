module tb_regset;
	reg Clk, RW;
	reg [3:0] Data_in;
	reg [2:0] Address;
	
	wire [3:0] Data_out;
	
	regset UUT (Data_out, Clk, RW, Data_in, Address);
	
	initial Clk = 0; 
    always #2 Clk = ~Clk;
	
	initial
	begin
		$dumpfile("registrySet.vpd");
		$dumpvars;
			
		$finish;
	end
endmodule