// Michaela Bartz and Shruti Misra
// Creates a 2 input to 1 output mux 

`timescale 1 ps / 100 fs

module mux2_1Bit(out, in0, in1, sel);    
	output out;    
	input sel, in0, in1;
	
	wire selBar;
	wire [1:0] temp;
	
	not #50(selBar, sel);
	and #50(temp[0], in0, selBar);
	and #50(temp[1], in1, sel);
	or #50(out, temp[0], temp[1]);
	
endmodule 

module mux2_1Bit_testbench();  
	reg sel;  
	reg in0, in1;
	wire out;  
 
	mux2_1Bit dut (.out, .in0, .in1, .sel); 
	
	initial begin    
		sel=0; in0=0; in1=1; #10;  
		sel=0; in0=1; in1=0; #10;  
		sel=0; in0=1; in1=1; #10;  
		sel=0; in0=0; in1=0; #10;  
		sel=1; in0=0; in1=1; #10;  
		sel=1; in0=1; in1=0; #10;  
		sel=1; in0=1; in1=1; #10;  
		sel=1; in0=0; in1=0; #10;  
 
	end 
endmodule 