module PipelineMem( RegDest_wr, RegWrite_wr, 
                    RegDest_mem, RegWrite_mem, clk, reset);
								
  output   RegDest_wr, RegWrite_wr;
  input    RegDest_mem, RegWrite_mem, clk, reset;
  wire [1:0] dffOut;
  wire [1:0] dffIn;
 
 // Assign output of flip flops to the output of the module
assign RegDest_wr = dffOut[0];
assign RegWrite_wr = dffOut[1];

// Assign the input of flip flops to the input of module
assign dffIn[0] = RegDest_mem;
assign dffIn[1] = RegWrite_mem;

 genvar i; 
 generate
 for(i=0; i< 2; i++) begin : eachSignal
		D_FF signals (.q(dffOut[i]), .d(dffIn[i]), .reset, .clk);
		end 
endgenerate
endmodule 

