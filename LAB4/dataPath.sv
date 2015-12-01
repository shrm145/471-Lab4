// Michaela Bartz and Shruti Misra
`timescale 1 ps / 100 fs

module dataPath(regRS, negative, zero, CarryOut, overflow, Rs, Rt, Rd, imm16, Branch, ALUSource, RegWrite, MemWrite, MemToReg, RegDest, ALUControl, reset, clk);
	output [29:0] regRS;
	output negative, zero, CarryOut, overflow;
		
	input Branch, ALUSource, RegWrite, MemWrite, MemToReg, RegDest;
	input clk, reset;
	input [1:0] ALUControl;
	input [4:0] Rs, Rt, Rd;
	input [15:0] imm16;
	
	// RegFile wires
	wire [31:0] WriteData;
	wire [31:0] readRs, readRt;
	wire [4:0] WriteRegAddr;
	wire [31:0] signExImm16;
	
	// ALU wires
	wire [31:0] constCPU, BussB;

	// Memory wires
	wire [31:0] memData;
	
	// Pipelining wires
	wire [31:0] toALU1, toALU2, storedRt1, storedRt2, dataIn, dataOut, memAddr, writeVal, writeToReg;
	wire [4:0] Rt_ex, Rd_ex, Rt_mem, Rd_mem, Rt_wr, Rd_wr;
	
	// Pipeline Control wires
	//wire ALUSrc_dec, Branch_dec, ALUControl0_dec, ALUControl1_dec, MemWrite_dec, MemToReg_dec, RegDest_dec, RegWrite_dec;
	wire ALUSrc_ex, Branch_ex, ALUControl0_ex, ALUControl1_ex, MemWrite_ex, MemToReg_ex, RegDest_ex, RegWrite_ex;
	wire MemWrite_mem, MemToReg_mem, RegDest_mem, RegWrite_mem;
	wire RegDest_wr, RegWrite_wr;
	wire [1:0] RsCtrl, RtCtrl;
	wire [31:0] writeData_fwd, ALUoutput_fwd;

	
	// ------ REG DECODE / WRITEBACK STAGE ------
	
	DecodeReg decStage (.regRS, .toALU1, .toALU2, .storedRt1, . Rt_ex, .Rd_ex, .ALUSource, .Branch, .regWrite(RegWrite_wr), .writeToReg, .Rd, .Rt, .Rs, .WriteRegAddr, .imm16, .writeData_fwd, .ALUoutput_fwd, .RsCtrl, .RtCtrl, .clk, .reset);
	
	forwarding Rs_fwd (.forwardCtrl(RsCtrl), .Rt_ex, .Rd_ex, .Rt_mem, .Rd_mem, .regDest_Ex(RegDest_ex), .regDest_Mem(RegDest_mem), .writeEnable_mem(MemWrite_mem), .RegWrite_ex, .Rvalue(Rs));
	forwarding Rt_fwd (.forwardCtrl(RtCtrl), .Rt_ex, .Rd_ex, .Rt_mem, .Rd_mem, .regDest_Ex(RegDest_ex), .regDest_Mem(RegDest_mem), .writeEnable_mem(MemWrite_mem), .RegWrite_ex, .Rvalue(Rt));
	
	PipelineDecode decCtrls (.ALUSrc_ex, .Branch_ex, .ALUControl0_ex, .ALUControl1_ex, .MemWrite_ex, .MemToReg_ex, .RegDest_ex, .RegWrite_ex, 
                        .ALUSrc_dec(ALUSource), .Branch_dec(Branch), .ALUControl0_dec(ALUControl[0]), .ALUControl1_dec(ALUControl[1]), .MemWrite_dec(MemWrite), .MemToReg_dec(MemToReg), .RegDest_dec(RegDest), .RegWrite_dec(RegWrite), .clk, .reset);

	// ------ EXECUTE STAGE ------	
	
	Execute exStage(.ALUoutput_fwd, .memAddr, .storedRt2, .Rt_mem, .Rd_mem, .negative, .zero, .CarryOut, .overflow, .ALUControl({ALUControl1_ex, ALUControl0_ex}), .toALU1, .toALU2, .storedRt1, .Rt_ex, .Rd_ex, .reset, .clk);
	
	PipelineExecute exCtrls (.MemWrite_mem, .MemToReg_mem, .RegDest_mem, .RegWrite_mem, 
                         .MemWrite_ex, .MemToReg_ex, .RegDest_ex, .RegWrite_ex, .clk, .reset);
	
	// ------ MEMORY STAGE ------
	
	Memory memStage (.writeData_fwd, .writeToReg, .Rt_wr, .Rd_wr, .MemWrite(MemWrite_mem), .MemToReg(MemToReg_mem), .memAddr, .storedRt2, .Rt_mem, .Rd_mem, .clk, .reset);
	
	PipelineMem memCtrls (.RegDest_wr, .RegWrite_wr, .RegDest_mem, .RegWrite_mem, .clk, .reset);
	
	// 
	// determines which register address is writen to in regfile
	mux2_1_5Bit regDestMux (.out(WriteRegAddr), .in0(Rt_wr), .in1(Rd_wr), .sel(RegDest_wr));
	
endmodule 

module dataPath_testbench();
	wire [29:0] regRS;
	wire negative;
	reg Branch, ALUSource, RegWrite, MemWrite, MemToReg, RegDest, clk;
	reg [1:0] ALUControl;
	reg [4:0] Rs, Rt, Rd;
	reg [15:0] imm16;
	
	parameter ClockDelay = 5000;
	
	dataPath dut(.regRS, .negative, .Rs, .Rt, .Rd, .imm16, .Branch, .ALUSource, 
					 .RegWrite, .MemWrite, .MemToReg, .RegDest, .ALUControl, .clk);
					 
	initial begin
		// EXPECTED CASES
			
			// ADDI set reg[1] = reg[0] + 4 = 4
			// output: reg[rs] = X; negative = 0;
			Rs <= 5'b00000;
			Rt <= 5'b00001; 
			Rd <= 5'b00010; // dont czre
			imm16 <= 16'b0100; // 4
			RegDest <= 1'b1; // dont care
			ALUSource <= 1'b1;
			RegWrite <= 1'b0;
			MemWrite <= 1'b0; 
			MemToReg <= 1'b0; // dont care
			Branch <= 1'b0;
			ALUControl <= 2'b00; //add 	
			@(posedge clk)
			
			// STORE set Mem [1 + reg[0]] = reg[1] = 4
			// output: reg[rs] = 0; negative = dont care
			Rs <= 5'b00000;
			Rt <= 5'b00001; 
			Rd <= 5'b00010; // dont care
			imm16 <= 16'b01; // 4
			RegDest <= 1'b1; // dont care
			ALUSource <= 1'b1; //dont care
			RegWrite <= 1'b0;
			MemWrite <= 1'b1; 
			MemToReg <= 1'b0; // dont care
			Branch <= 1'b0; // dont care
			ALUControl <= 2'b00; //add 	
			@(posedge clk)
			
			
			// ADDI set reg[2] = reg[1] + 3 = 7
			// output: reg[rs] = 4; negative = 0;
			Rs <= 5'b00001;
			Rt <= 5'b00010; 
			Rd <= 5'b00010; // dont care
			imm16 <= 16'b0011; // 3
			RegDest <= 1'b1; // dont care
			ALUSource <= 1'b1;
			RegWrite <= 1'b0;
			MemWrite <= 1'b0; 
			MemToReg <= 1'b0; // dont care
			Branch <= 1'b0;
			ALUControl <= 2'b00; //add 	
			@(posedge clk)
			
			
		// ERROR HANDLING
	
	
	$stop;
	end

	initial clk = 0;
	always begin
		#(ClockDelay/2); 
		clk = ~clk;
	end	
	
endmodule 