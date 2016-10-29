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
			RW=0;
			Address=3'b000;
			Data_in=4'b0101;
			#4
			RW=0;
			Address=3'b001;
			Data_in=4'd15;
			#4
			RW=0;
			Address=3'b010;
			Data_in=4'd11;
			#4
			RW=0;
			Address=3'b011;
			Data_in=4'd8;
			#4
			RW=0;
			Address=3'b100;
			Data_in=4'd9;
			#4
			RW=0;
			Address=3'b101;
			Data_in=4'd4;
			#4
			RW=0;
			Address=3'b110;
			Data_in=4'd12;
			#4
			RW=0;
			Address=3'b111;
			Data_in=4'd7;
			#4			
			RW=1;
			Address=3'b111;
			#10
			RW=1;
			Address=3'b110;
			#10
			RW=1;
			Address=3'b101;
			#10
			RW=1;
			Address=3'b100;
			#10
			RW=1;
			Address=3'b011;
			#10
			RW=0;
			Address=3'b010;
			#10
			RW=1;
			Address=3'b001;
			#10
			RW=1;
			Address=3'b000;
			#10
			
		$finish;
	end
endmodule