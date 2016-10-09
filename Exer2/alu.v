// iverilog -o Ex2c Ex2c.v Ex2b.v Ex2a.v Ex1a.v Ex1b.v Ex1c.v Ex2c-tb.v
module alu4 (Res,Of,A,B,Cin,Mode);
	input [3:0] A, B;
	input Cin;
	input [2:0] Mode;
	output [3:0] Res;
	output Of;
	
	wire [3:0] wres;
	wire [3:0] temp_1, temp_2, temp_3, temp_4, temp_5, temp_6, temp_7, temp_8;
	wire [3:0] temp_mux1, temp_mux2;
	wire [1:0] temp_out;
	wire temp_s, Cout, Bout;
	wire wof;
	
	fouraddr f1(temp_1, temp_out[0], A, B, Cin);
	subt 	  s1(temp_2, temp_out[1], A, B);
	comp4    c1(temp_3, A, B);
	assign temp_4 = (A & B);
	assign temp_5 = (A | B);
	assign temp_6 = (~A);
	assign temp_7 = (A+1);
	assign temp_8 = (A-1); 
	mux41    m1(temp_mux1, temp_1, temp_2, temp_3, temp_4, Mode[1:0]);
	mux41    m2(temp_mux2, temp_5, temp_6, temp_7, temp_8, Mode[1:0]);
	mux41    m3(Res, temp_mux1, temp_mux2, temp_mux1, temp_mux2, {1'b0, Mode[2]});
	assign temp_s = (Mode[2]| Mode[1]);
	assign Of = (Mode==1'd0) ? temp_out[0] : ( (Mode==1'd1) ? temp_out[1] : 1'bZ);
	// module mux41 (Y,A,B,C,D,S);
	// input [3:0] A, B, C, D;
	// input [1:0] S;
	// output [3:0] Y;
	//mux41    m4(Of, {3'b000,temp_out[0]}, {3'b000,temp_out[1]}, {4'b0000}, {4'b0000}, {Mode[0], temp_s});
	// mux41 		m4(Of, {4'b0000}, {4'b0000}, {3'b000,temp_out[1]}, {3'b000,temp_out[0]}, {temp_s, Mode[0]});
	/*always @ (*)
	begin
		case (Mode)
			3'b000 : 
				begin
					fouraddr f1(Res, Of, A, B, Cin);
				end
			3'b001 : subt s1(Res, Of, A, B);
			3'b010 : 
				begin
					assign Of = Z;
					comp4 c1(Res, A, B);
				end
			3'b011 : 
				begin
					assign Of = Z;
					assign Res = A && B;
				end
			3'b100 : 
				begin
					assign Of = Z;
					assign Res = A || B;
				end
			3'b101 : 
				begin
					assign Of = Z;
					assign Res = ~A;
				end
			3'b110 : fouraddr f2(Res, Of, A, 1, 0);
			3'b111 : subt s2(Res, Of, A, 1);
		endcase
	end
	*/
	// assign Res = S[2] ? ( s[1] ? ( s[0] ? subt S0 ) : () ) : ();
endmodule