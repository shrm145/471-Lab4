// Michaela Bartz and Shruti Misra
`timescale 1 ps / 100 fs

module PC (outPC, inPC, reset, clk);
output [29:0] outPC;
input [29:0] inPC;
input clk, reset;

	genvar i;
	
	generate
		for(i=0; i<30; i++) begin : eachDff
			D_FF df (.q(outPC[i]), .d(inPC[i]), .reset, .clk);
		end
	endgenerate
	
endmodule 

module PC_testbench();
wire [29:0] outPC;
reg [29:0] inPC;
reg clk, reset;
 
	parameter period = 100000;
	
	PC dut (.outPC, .inPC, .reset, .clk);
 
	initial clk = 1;
	
	always begin
		#(period/2);
		clk = ~clk;
	end 
	
	initial begin
		reset <= 1; inPC <= 0; 		@(posedge clk);@(posedge clk);@(posedge clk);
		reset <= 0; 								@(posedge clk);@(posedge clk);@(posedge clk);
		inPC <= 2;  									@(posedge clk);@(posedge clk);@(posedge clk);
		inPC <= 5; 										@(posedge clk);@(posedge clk);@(posedge clk);
		inPC <= 1; 										@(posedge clk);@(posedge clk);@(posedge clk);
		inPC <= 5; 										@(posedge clk);@(posedge clk);@(posedge clk);
		inPC <= 1; 										@(posedge clk);@(posedge clk);@(posedge clk);
		$stop;
	end
endmodule
