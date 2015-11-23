//Michaela Bartz and Shruti Misra

module mux2_1(out, in, sel);    
	output out;    
	input sel;
	input [1:0] in;
	
	wire selBar, in0, in1;
	
	not(selBar, sel);
	and(in0, in[0], selBar);
	and(in1, in[1], sel);
	or(out, in1, in0);
	
endmodule 

module mux2_1_testbench();  
	reg sel;  
	reg [1:0] in;
	wire out;  
 
	mux2_1 dut (.out, .in, .sel); 
	
	initial begin    
		sel=0; in[0]=0; in[1]=1; #10;  
		sel=0; in[0]=1; in[1]=0; #10;  
		sel=0; in[0]=1; in[1]=1; #10;  
		sel=0; in[0]=0; in[1]=0; #10;  
		sel=1; in[0]=0; in[1]=1; #10;  
		sel=1; in[0]=1; in[1]=0; #10;  
		sel=1; in[0]=1; in[1]=1; #10;  
		sel=1; in[0]=0; in[1]=0; #10;  
 
	end 
endmodule 