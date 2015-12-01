// Michaela Bartz and Shruti Misra
`timescale 1 ps / 100 fs

module controls (Branch, Jump, JR, ALUSource, ALUControl, RegWrite, MemWrite, MemToReg, RegDest, instruction);
	input [31:0] instruction;
	output reg Branch, Jump, JR, ALUSource, RegWrite, MemWrite, MemToReg, RegDest;
	output reg [1:0] ALUControl;
	 
	wire [5:0] op, funct;
	assign op = instruction[31:26];
	assign funct = instruction[5:0];
	
	always @ (*)
	begin
		if(op == 6'b000000) begin // R-TYPE
			if(funct == 6'b001000) begin // JR
				RegDest = 	1'b0;
				ALUSource = 1'b1;
				RegWrite = 	1'b0;
				MemWrite = 	1'b0; 
				MemToReg = 	1'bX;
				Branch = 	1'b0;
				Jump = 		1'b0;
				JR = 			1'b1; 
				ALUControl= 2'b00; //add 				
			end
			else if(funct == 6'b100011) begin // SUBU
				RegDest = 	1'b1;
				ALUSource = 1'b0;
				RegWrite = 	1'b1;
				MemWrite = 	1'b0; 
				MemToReg = 	1'b0;
				Branch = 	1'b0;
				Jump = 		1'b0;
				JR = 			1'b0; 
				ALUControl= 2'b01; //sub	
			end
			else if(funct == 6'b100111) begin // NOR
				RegDest = 	1'b1;
				ALUSource = 1'b0;
				RegWrite = 	1'b1;
				MemWrite = 	1'b0; 
				MemToReg = 	1'b0;
				Branch = 	1'b0;
				Jump = 		1'b0;
				JR = 			1'b0; 
				ALUControl= 2'b10; //nor 	
			end
			else if(funct == 6'b101011) begin // SLTU (funct=43)
				RegDest = 	1'b1;
				ALUSource = 1'b0;
				RegWrite = 	1'b1;
				MemWrite = 	1'b0; 
				MemToReg = 	1'b0;
				Branch = 	1'b0;
				Jump = 		1'b0;
				JR = 			1'b0; 
				ALUControl= 2'b10; //sltu 
			end
			else begin // dont write, jump or branch
				RegDest = 	1'b0;
				ALUSource = 1'bX;
				RegWrite = 	1'b0;
				MemWrite = 	1'b0; 
				MemToReg = 	1'bX;
				Branch = 	1'b0;
				Jump = 		1'b0;
				JR = 			1'b0; 
				ALUControl= 2'bXX; //dont care		
			end 
		end
		
		else if (op == 6'b000001) begin // BLTZ
			RegDest = 	1'b0;
			ALUSource = 1'b1;
			RegWrite = 	1'b0;
			MemWrite = 	1'b0; 
			MemToReg = 	1'b0;
			Branch = 	1'b1;
			Jump = 		1'b0;
			JR = 			1'b0; 
			ALUControl= 2'b01; //sltu
		end 
		
		else if (op == 6'b000010) begin // J target
			RegDest = 	1'b0;
			ALUSource = 1'b0;
			RegWrite = 	1'b0;
			MemWrite = 	1'b0; 
			MemToReg = 	1'b0;
			Branch = 	1'b0;
			Jump = 		1'b1;
			JR = 			1'b0; 
			ALUControl= 2'bXX; //dont care
		end
		
		else if (op == 6'b001000) begin // ADDI
			RegDest = 	1'b0;
			ALUSource = 1'b1;
			RegWrite = 	1'b1;
			MemWrite = 	1'b0; 
			MemToReg = 	1'b0;
			Branch = 	1'b0;
			Jump = 		1'b0;
			JR = 			1'b0; 
			ALUControl= 2'b00; //add
		end
		
		else if (op == 6'b100011) begin // LW
			RegDest = 	1'b0;
			ALUSource = 1'b1;
			RegWrite = 	1'b1;
			MemWrite = 	1'b0; 
			MemToReg = 	1'b1;
			Branch = 	1'b0;
			Jump = 		1'b0;
			JR = 			1'b0; 
			ALUControl= 2'b00; //add
		end 
		
		else if (op == 6'b101011) begin // SW (op = 43)
			RegDest = 	1'b0; // RegDest must have value for forwarding unit
			ALUSource = 1'b1;
			RegWrite = 	1'b0;
			MemWrite = 	1'b1; 
			MemToReg = 	1'b0;
			Branch = 	1'b0;
			Jump = 		1'b0;
			JR = 			1'b0; 
			ALUControl= 2'b00; //add
		end 	
	else begin // dont write or branch or jump
			RegDest = 	1'b0;
			ALUSource = 1'b0;
			RegWrite = 	1'b0;
			MemWrite = 	1'b0; 
			MemToReg = 	1'b0;
			Branch = 	1'b0;
			Jump = 		1'b0;
			JR = 			1'b0; 
			ALUControl= 2'bXX; //dont care
		end 			
	end
endmodule
	
	module controls_testbench();
	
	reg [31:0] instruction;
	wire Branch, Jump, JR, ALUSource, RegWrite, MemWrite, MemToReg, RegDest;
	wire [1:0] ALUControl;
	controls dut (.Branch, .Jump, .JR, .ALUSource, .ALUControl, .RegWrite, .MemWrite, .MemToReg, .RegDest, .instruction);
	 integer i;
    initial begin // Stimulus

 
	instruction[31:26] = 6'b000000 ; instruction[5:0] =6'b001000; #100;
	instruction[31:26] = 6'b000000 ; instruction[5:0] =6'b100011; #100;
	instruction[31:26] = 6'b000000 ; instruction[5:0] =6'b100111; #100;
	instruction[31:26] = 6'b000000 ; instruction[5:0] =6'b101011; #100;
	instruction[31:26] = 6'b000001 ; instruction[5:0] =6'b001000; #100;
	instruction[31:26] = 6'b000010 ; instruction[5:0] =6'b001000; #100;
	instruction[31:26] = 6'b001000 ; instruction[5:0] =6'b001000; #100;
	instruction[31:26] = 6'b100011 ; instruction[5:0] =6'b001000; #100;
	instruction[31:26] = 6'b101011 ; instruction[5:0] =6'b001000; #100;
	instruction[31:26] = 6'b111010 ; instruction[5:0] =6'b001000; #100;
	end 
	endmodule