module haddr (S, C, x, y);
	input x,y;
	output S, C;
	
	xor X1(S, x, y);
	and A1(C, x, y);
endmodule
