module DecodeReg (regRS, toALU1, toALU2, storedRt1, Rt_ex, Rd_ex, ALUSource, Branch,  regWrite, writeToReg, Rd, Rt, Rs, WriteRegAddr, imm16, writeData_fwd, ALUoutput_fwd, RsCtrl, RtCtrl, clk, reset);
	output [31:0] toALU1, toALU2, storedRt1;
	output [29:0] regRS;
	output [4:0] Rt_ex, Rd_ex;
	input [4:0] Rs, Rd, Rt, WriteRegAddr;
	input [15:0] imm16;
	input clk, reset, ALUSource, Branch, regWrite;
	input [31:0] writeToReg, writeData_fwd, ALUoutput_fwd;
	input [1:0] RsCtrl, RtCtrl;
	
	wire [31:0]  signExImm16, constCPU, BussB;
	wire [31:0] readRs, readRt, Rs_fwd, Rt_fwd;


	
	assign regRS = readRs[31:2];
	
	// register file of CPU. Can read 2 values
	regfile rf (.ReadData1(readRs), .ReadData2(readRt), .WriteData(writeToReg), 
			  .ReadRegister1(Rs), .ReadRegister2(Rt), .WriteRegister(WriteRegAddr),
			  .RegWrite(regWrite), .clk(~clk));

	// Sign extends imm16 value to 32 bit value
	signExtnd extImm16 (.outExtnd(signExImm16), .inExtnd(imm16));
			  
	// Determines if sign extended 16 bit or 32 bit 0 is sent as parameter		  
	mux2_1_32Bit signImmMux (.out(constCPU), .in0(signExImm16), .in1(32'b0), .sel(Branch));
	
	// Determines if the constant from signImmMux or the 2nd reg value is sent into ALU on BussB
	mux2_1_32Bit ALUSourceMux (.out(BussB), .in0(Rt_fwd), .in1(constCPU), .sel(ALUSource));
	
	// Forwarding Muxes
	mux4_1_32Bit RsForward (.out(Rs_fwd), .in0(readRs), .in1(ALUoutput_fwd), .in2(writeData_fwd), .in3(readRs), .sel(RsCtrl));
 	mux4_1_32Bit RtForward (.out(Rt_fwd), .in0(readRt), .in1(ALUoutput_fwd), .in2(writeData_fwd), .in3(readRt), .sel(RtCtrl));
	
	// Pipelining registers
	register32Bit ALUin1 (.q(toALU1), .d(Rs_fwd), .reset, .clk);
	register32Bit ALUin2 (.q(toALU2), .d(BussB), .reset, .clk);
	register32Bit RtOut (.q(storedRt1), .d(Rt_fwd), .reset, .clk);
	register32Bit RT (.q(Rt_ex), .d(Rt), .reset, .clk);
	register32Bit RD (.q(Rd_ex), .d(Rd), .reset, .clk);
	
endmodule 