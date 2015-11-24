module PipelineDecode(ALUSrc_ex, Branch_ex, ALUControl0_ex, ALUControl1_ex, MemWrite_ex, MemToReg_ex, RegDest_ex, RegWrite_ex, 
                        ALUSrc_dec, Branch_dec, ALUControl0_dec,ALUControl1_dec, MemWrite_dec, MemToReg_dec, RegDest_dec, RegWrite_dec, clk, reset);
								
  output ALUSrc_ex, Branch_ex, ALUControl0_ex, ALUControl1_ex, MemWrite_ex, MemToReg_ex, RegDest_ex, RegWrite_ex;
  input  ALUSrc_dec, Branch_dec, ALUControl0_dec, ALUControl1_dec, MemWrite_dec, MemToReg_dec, RegDest_dec, RegWrite_dec, clk, reset;
  wire [7:0] dffOut;
  wire [7:0] dffIn;
 
 // Assign output of flip flops to the output of the module
assign ALUSrc_ex = dffOut[0];
assign Branch_ex = dffOut[1];
assign ALUControl0_ex = dffOut[2];
assign ALUControl1_ex = dffOut[3];


assign MemWrite_ex = dffOut[4];
assign MemToReg_ex = dffOut[5];
assign RegDest_ex = dffOut[6];
assign RegWrite_ex = dffOut[7];

// Assign the input of flip flops to the input of module
assign dffIn[0] = ALUSrc_dec;
assign dffIn[1] = Branch_dec;
assign dffIn[2] = ALUControl0_dec;
assign dffIn[3] = ALUControl1_dec;
assign dffIn[4] = MemWrite_dec;
assign dffIn[5] = MemToReg_dec;
assign dffIn[6] = RegDest_dec;
assign dffIn[7] = RegWrite_dec;

 genvar i; 
 generate
 for(i=0; i< 8; i++) begin : eachSignal
		D_FF signals (.q(dffOut[i]), .d(dffIn[i]), .reset, .clk);
		end 
endgenerate
endmodule 

