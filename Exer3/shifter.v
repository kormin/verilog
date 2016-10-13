/*
 * Exercise: 3
 * Description: shifter
 * Script:
iverilog -o shifter shifter.v shifter-tb.v
vvp shifter
gtkwave shifter.vpd
 */
module shifter(R, A, Mode);
	input [3:0] A;
	input [2:0] Mode;
	
	output [3:0] R;	
	reg [3:0] R;
	
	always @ (*)
	begin
		case (Mode)
			3'b000: R <= {A[2:0], 1'b0};
			3'b001: R <= {A[2:0], 1'b1};
			3'b010: R <= {1'b0, A[3:1]};
			3'b011: R <= {1'b1, A[3:1]};
			3'b100: R <= A <<< 1;
			3'b101: R <= {A[3], A[3:1]};
			3'b110: R <= {A[2:0], A[3]};
			3'b111: R <= {A[0], A[3:1]};
		endcase
	end
endmodule