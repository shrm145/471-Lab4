module DecodeReg (regRS, toALU1, toALU2, storedRt1, ALUSource, Branch, RegDest, regWrite, writeToReg, Rt, Rs, Rd, imm16, clk, reset);
	output [31:0] toALU1, toALU2, storedRt1;
	output [29:0] regRS;
	input [4:0] Rs, Rt, Rd;
	input [15:0] imm16;
	input clk, reset, ALUSource, Branch, RegDest, regWrite;
	input [31:0] writeToReg;
	
	wire [31:0]  signExImm16, constCPU, BussB;
	wire [31:0] readRs, readRt;
	wire [4:0] WriteRegAddr;
	
	assign regRS = readRs[31:2];
 	
	// determines which register address is writen to in regfile
	mux2_1_5Bit regDestMux (.out(WriteRegAddr), .in0(Rt), .in1(Rd), .sel(RegDest));
	
	// register file of CPU. Can read 2 values
	regfile rf (.ReadData1(readRs), .ReadData2(readRt), .WriteData(writeToReg), 
			  .ReadRegister1(Rs), .ReadRegister2(Rt), .WriteRegister(WriteRegAddr),
			  .RegWrite(regWrite), .clk(~clk));

	// Sign extends imm16 value to 32 bit value
	signExtnd extImm16 (.outExtnd(signExImm16), .inExtnd(imm16));
			  
	// Determines if sign extended 16 bit or 32 bit 0 is sent as parameter		  
	mux2_1_32Bit signImmMux (.out(constCPU), .in0(signExImm16), .in1(32'b0), .sel(Branch));
	
	// Determines if the constant from signImmMux or the 2nd reg value is sent into ALU on BussB
	mux2_1_32Bit ALUSourceMux (.out(BussB), .in0(readRt), .in1(constCPU), .sel(ALUSource));
	
	// Pipelining registers
	register32Bit ALUin1 (.q(toALU1), .d(readRs), .reset, .clk);
	register32Bit ALUin2 (.q(toALU2), .d(BussB), .reset, .clk);
	register32Bit RT1 (.q(storedRt1), .d(readRt), .reset, .clk);
	
endmodule 