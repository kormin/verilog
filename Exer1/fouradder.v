module fouraddr (S, Cout, A, B, Cin);
	input [3:0] A,B;
	input Cin;
	output [3:0] S;
	output Cout;
	wire [2:0] w;
	faddr FA0 (S[0],w[0],A[0],B[0],Cin);
	faddr FA1 (S[1],w[1],A[1],B[1],w[0]);
	faddr FA2 (S[2],w[2],A[2],B[2],w[1]);
	faddr FA3 (S[3],Cout,A[3],B[3],w[2]);
endmodule
