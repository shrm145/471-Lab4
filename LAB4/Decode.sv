 module Decode(toALU1, toALU2, storedRt, imm16, Rd, Rt, Rs, Branch, RegWrite, ALUSource,RegDest, clk, reset);
	output [31:0] toALU1, toALU2, storedRt;
 
	input Branch, ALUSource, RegWrite, RegDest;
	input clk, reset;	
	input [4:0] Rs, Rt, Rd;
	input [15:0] imm16;
	
	// REGFILE
	wire [31:0] WriteData;
	wire [31:0] readRs, readRt;
	wire [4:0] WriteRegAddr;
	wire [31:0] signExImm16;
 
  // determines which register address is writen to in regfile
	mux2_1_5Bit regDestMux (.out(WriteRegAddr), .in0(Rt), .in1(Rd), .sel(RegDest));
	
	// register file of CPU. Can read 2 values
	regfile rf (.ReadData1(readRs), .ReadData2(readRt), .WriteData, 
			  .ReadRegister1(Rs), .ReadRegister2(Rt), .WriteRegister(WriteRegAddr),
			  .RegWrite, .clk(~clk);

	// NEED SIGN EXTEND HERE (output to in0 ob signImmMux below)
	signExtnd extImm16 (.outExtnd(signExImm16), .inExtnd(imm16));
			  
	// Determines if sign extended 16 bit or 32 bit 0 is sent as parameter		  
	mux2_1_32Bit signImmMux (.out(constCPU), .in0(signExImm16), .in1(32'b0), .sel(Branch));
	
	// Determines if the constant from signImmMux or the 2nd reg value is sent into ALU on BussB
	mux2_1_32Bit ALUSourceMux (.out(BussB), .in0(readRt), .in1(constCPU), .sel(ALUSource));
	
	
endmodule 