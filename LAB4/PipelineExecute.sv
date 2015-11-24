module PipelineExecute(  MemWrite_mem, MemToReg_mem, RegDest_mem, RegWrite_mem, 
                         MemWrite_ex, MemToReg_ex, RegDest_ex, RegWrite_ex, clk, reset);
								
  output  MemWrite_mem, MemToReg_mem, RegDest_mem, RegWrite_mem;
  input   MemWrite_ex, MemToReg_ex, RegDest_ex, RegWrite_ex, clk, reset;
  wire [3:0] dffOut;
  wire [3:0] dffIn;
 
 // Assign output of flip flops to the output of the module
assign MemWrite_mem = dffOut[0];
assign MemToReg_mem = dffOut[1];
assign RegDest_mem = dffOut[2];
assign RegWrite_mem = dffOut[3];

// Assign the input of flip flops to the input of module
assign dffIn[0] = MemWrite_ex;
assign dffIn[1] = MemToReg_ex;
assign dffIn[2] = RegDest_ex;
assign dffIn[3] = RegWrite_ex;

 genvar i; 
 generate
 for(i=0; i< 4; i++) begin : eachSignal
		D_FF signals (.q(dffOut[i]), .d(dffIn[i]), .reset, .clk);
		end 
endgenerate
endmodule 

