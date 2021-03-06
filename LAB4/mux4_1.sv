//Michaela Bartz and Shruti Misra

module mux4_1(out, in, sel);
	output out;    
	input [1:0] sel;
	input [3:0] in;
	
	wire [1:0] tempIn;
	
	mux2_1 mux0 (.out(tempIn[0]), .in(in[1:0]), .sel(sel[0]));
	mux2_1 mux1 (.out(tempIn[1]), .in(in[3:2]), .sel(sel[0]));
	mux2_1 master (.out, .in(tempIn), .sel(sel[1]));

endmodule 

module mux4_1_testbench();

	wire out;    
	reg [1:0] sel;
	reg [3:0] in;
	
	mux4_1 dut (.out, .in, .sel); 

	integer i, j;
	initial begin // Stimulus
		for(i=0; i<4; i++) begin
			sel = i; 
			for(j=0; j<16; j++) begin
				in = j; #10;
			end
		end		
	end 
 
endmodule 