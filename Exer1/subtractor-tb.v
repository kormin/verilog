module tb_subtractor;
	reg [3:0] a,b;
	wire [3:0] d;
	wire bout;
	
	subt UUT(.D(d), .Bout(bout), .A(a), .B(b));
	
	initial
		begin
			$dumpfile("subtractor.vpd");
			$dumpvars;
			
			a[3]=0; a[2]=0; a[1]=0; a[0]=1; 
			b[3]=0; b[2]=0; b[1]=1; b[0]=1; 
			#10
			a[3]=0; a[2]=0; a[1]=1; a[0]=0; 
			b[3]=0; b[2]=1; b[1]=1; b[0]=0; 
			#10
			a[3]=0; a[2]=1; a[1]=0; a[0]=0; 
			b[3]=1; b[2]=1; b[1]=0; b[0]=0; 
			#10
			a[3]=1; a[2]=0; a[1]=0; a[0]=0; 
			b[3]=1; b[2]=0; b[1]=0; b[0]=1; 
			#10
			a=4'b1101;
			b=4'b0110;
			#10
			a=4'b1010;
			b=4'b0101;
			#10
			
		$finish;
	end
endmodule