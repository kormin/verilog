/*
 * Exercise: 4
 * Description: Program Counter
 * Comments:
 * Script:
iverilog -o progCntr progCntr.v progCntr-tb.v
vvp progCntr
gtkwave progCntr.vpd
 */
module progCntr (Y, A, Clk, nReset, CountEn, Load);
	input [7:0] A;
	input Clk, nReset, CountEn, Load;
	
	output [7:0] Y;
	reg [7:0] Y;
	
	//assign nReset = CountEn &~ Load  (Y==8'b11111111);
	always @ (negedge Clk or negedge nReset or posedge Load)
	begin
		if(!nReset) Y <= 8'b00000000;
		else if(Load) Y <= A;
		else if(CountEn) begin
			 Y <= Y + 1'b1;
		end
	end
	
endmodule