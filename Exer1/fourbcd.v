/*
 * Exercise: 1
 * Description: 4 bit bcd
 * Script:
iverilog -o fourbcd fourbcd.v fourbcd-tb.v halfadder.v fulladder.v
vvp fourbcd
gtkwave fourbcd.vpd
 */
module fourbcd (S, A, B);
	input [3:0] A,B;
	output [7:0] S;
	wire [32:0] w;
	
	//halfadder (S, C, x, y);
	//fulladder (S,C,X,Y,Z);
	and A1(S[0],A[0], B[0]);
	
	and A2(w[0],A[1], B[0]);
	and A3(w[1],A[0], B[1]);
	halfadder H1(S[1],w[15],w[0],w[1]);
	
	and A4(w[2],A[0], B[2]);
	and A5(w[3],A[1], B[1]);
	and A6(w[4],A[2], B[0]);
	halfadder H2(w[17],w[16],w[2],w[3]);
	fulladder F1(S[2],w[18],w[4],w[17],w[15]);
	
	and A7(w[5],A[0], B[3]);
	and A8(w[6],A[1], B[2]);
	and A9(w[7],A[2], B[1]);
	and A10(w[8],A[3], B[0]);
	halfadder H3(w[20],w[19],w[6],w[5]);
	fulladder F2(w[22],w[21],w[7],w[20],w[16]);
	fulladder F3(S[3],w[23],w[8],w[22],w[18]);
	
	and A11(w[9],A[1], B[3]);
	and A12(w[10],A[2], B[2]);
	and A13(w[11],A[3], B[1]);
	fulladder F4(w[25],w[24],w[10],w[9],w[19]);
	fulladder F5(w[27],w[26],w[11],w[25],w[21]);
	halfadder H4(S[4],w[28],w[27],w[23]);
	
	
	and A14(w[12],A[2], B[3]);
	and A15(w[13],A[3], B[2]);
    fulladder F6(w[29],w[31],w[24],w[13],w[12]);
	fulladder F7(S[5],w[30],w[29],w[28],w[26]);
	
	and A16(w[14],A[3], B[3]);
	fulladder F8(S[6],S[7],w[14],w[31],w[30]);
endmodule
