/*
 * Exercise: 2
 * Description: Multiplexer 4 to 1
 * Script:
iverilog -o mux mux.v mux-tb.v
vvp mux
gtkwave mux.vpd
 */
 module tb_mult1;
	reg [3:0] a, b, c, d;
	reg [1:0] s;
	wire [3:0] y;
	mux41 UUT(y,a,b,c,d,s);
	initial
		begin
			$dumpfile("Ex2b.vpd");
			$dumpvars;
			s= 2'b00;
			a= 4'b1111;
			b= 4'b1110;
			c= 4'b1100;
			d= 4'b1000;
			#10
			s= 2'b01;
			a= 4'b1111;
			b= 4'b1110;
			c= 4'b1100;
			d= 4'b1000;
			#10
			s= 2'b10;
			a= 4'b1111;
			b= 4'b1110;
			c= 4'b1100;
			d= 4'b1000;
			#10
			s= 2'b11;
			a= 4'b1111;
			b= 4'b1110;
			c= 4'b1100;
			d= 4'b1000;
			#10
			s= 2'b00;
			a= 4'b0000;
			b= 4'b0001;
			c= 4'b0010;
			d= 4'b0011;
			#10
			s= 2'b10;
			a= 4'b0000;
			b= 4'b0001;
			c= 4'b0010;
			d= 4'b0011;
			#10
			s= 2'b01;
			a= 4'b0000;
			b= 4'b0001;
			c= 4'b0010;
			d= 4'b0011;
			#10
			s= 2'b11;
			a= 4'b0000;
			b= 4'b0001;
			c= 4'b0010;
			d= 4'b0011;
			#10
			s= 2'b01;
			a= 4'b0110;
			b= 4'b0111;
			c= 4'b0010;
			d= 4'b0011;
			#10
			s= 2'b11;
			a= 4'b0000;
			b= 4'b0001;
			c= 4'b0010;
			d= 4'b0101;
			#10
		$finish;
	end
endmodule