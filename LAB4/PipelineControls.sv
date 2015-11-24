module PipelineControls(ALUSrc_out, Bracnh_out, ALUControl0_out, ALUControl1_out, MemWrite_out, MemToReg_out, RegDest_out, RegWrite_out, 
                        ALUSrc_in, ALUBranch_in, ALUControl0_in,ALUControl1_in, MemWrite_in, MemToReg_in, RegDest_in, RegWrite_in, clk, reset);
								
  output ALUSrc_out, Bracnh_out, ALUControl0_out, ALUControl1_out, MemWrite_out, MemToReg_out, RegDest_out, RegWrite_out;
  input  ALUSrc_in, ALUBranch_in, ALUControl0_in, ALUControl1_in, MemWrite_in, MemToReg_in, RegDest_in, RegWrite_in, clk, reset
  wire [7:0] dffOut;
  wire [7:0] dffIn;
 
 // Assign output of flip flops to the output of the module
assign ALUSrc_out = dffOut[0];
assign Branch_out = dffOut[1];
assign ALUControl0_out = dffOut[2];
assign ALUControl1_out = dffOut[3];
assign MemWrite_out = dffOut[4];
assign MemToReg_out = dffOut[5];
assign RegDest_out = dffOut[6];
assign RegWrite_out = dffOut[7];

// Assign the input of flip flops to the input of module
assign ALUSrc_in = dffIn[0];
assign Branch_in = dffIn[1];
assign ALUControl0_in = dffIn[2];
assign ALUControl1_in = dffIn[3];
assign MemWrite_in = dffIn[4];
assign MemToReg_in = dffIn[5];
assign RegDest_in = dffIn[6];
assign RegWrite_in = dffO=In[7];

 genvar i; 
 generate
 for(i=0; i< 8; i++) begin : eachSignal
		D_FF signals (.q(dffOut[i]), .d(dffIn[i]), .reset, .clk);
		end 
endgenerate
endmodule 

