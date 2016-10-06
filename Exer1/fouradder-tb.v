/*
 * Exercise: 1
 * Description: 4 bit adder test bench
 * Script:
iverilog -o fouradder fouradder.v fouradder-tb.v fulladder.v
vvp fouradder
gtkwave fouradder.vpd
 */
 module tb_fouradder;
	reg [3:0] a,b;
	reg cin; 
	wire [3:0] s;
	wire cout;
	
	fouradder UUT(.S(s), .Cout(cout), .A(a), .B(b), .Cin(cin));
	
	initial
		begin
			$dumpfile("fouradder.vpd");
			$dumpvars;
			
			a[3]=0; a[2]=0; a[1]=0; a[0]=1; 
			b[3]=0; b[2]=0; b[1]=1; b[0]=1; 
			cin=0;
			#10
			a[3]=0; a[2]=0; a[1]=1; a[0]=0; 
			b[3]=0; b[2]=1; b[1]=1; b[0]=0; 
			cin=0; 
			#10
			a[3]=0; a[2]=1; a[1]=0; a[0]=0; 
			b[3]=1; b[2]=1; b[1]=0; b[0]=0; 
			cin=0;
			#10
			a[3]=1; a[2]=0; a[1]=0; a[0]=0; 
			b[3]=1; b[2]=0; b[1]=0; b[0]=1; 
			cin=0;
			#10
			a[3]=0; a[2]=0; a[1]=0; a[0]=1; 
			b[3]=0; b[2]=0; b[1]=1; b[0]=1; 
			cin=1;
			#10
			a[3]=0; a[2]=0; a[1]=1; a[0]=0; 
			b[3]=0; b[2]=1; b[1]=1; b[0]=0; 
			cin=1; 
			#10
			a[3]=0; a[2]=1; a[1]=0; a[0]=0; 
			b[3]=1; b[2]=1; b[1]=0; b[0]=0; 
			cin=1;
			#10
			a[3]=1; a[2]=0; a[1]=0; a[0]=0; 
			b[3]=1; b[2]=0; b[1]=0; b[0]=1; 
			cin=1;
			#10

		$finish;
	end
endmodule