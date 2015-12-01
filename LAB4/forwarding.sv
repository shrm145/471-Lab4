/*
Forwarding Cases for RS: (Same for RT)

Forward ALUOutput:
-If the write destination in execute stage == Rs in decode

Forward MemoryOutput:
-If the write destination in memory stage == Rs in decode AND you are reading memory


Notes From Lecture:
-Dont forward register 0. Always 0.
-If Execute and Memory Stages both forward then use most recent. (Execute)

*/

module forwarding (forwardCtrl, Rt_ex, Rd_ex, Rt_mem, Rd_mem, regDest_Ex, regDest_Mem, writeEnable_mem, RegWrite_ex, Rvalue);
	output reg[1:0] forwardCtrl;
	input [4:0] Rt_ex, Rd_ex, Rt_mem, Rd_mem, Rvalue;
	input  regDest_Ex, regDest_Mem, writeEnable_mem, RegWrite_ex;
	
	reg [4:0] writeAddr_Ex, writeAddr_Mem;

	always @(*) begin 
	
		// calculate writeAddr_Ex
		if (regDest_Ex == 1'b0) writeAddr_Ex = Rt_ex;
		else writeAddr_Ex = Rd_ex;
			
		// calculate writeAddr_Mem
		if (regDest_Mem == 1'b0) writeAddr_Mem = Rt_mem;
		else writeAddr_Mem = Rd_mem;

		// calculate forward mux ctrl value

		//sent readRs through. Do not forward zero reg
		if (Rvalue == 0) forwardCtrl = 2'b00;
			
		//forward ALUOutput if writing to regFile. if both are same address forward most recent (Ex)
		else if (writeAddr_Ex == Rvalue) 
			// forward ALUOutput. You are writing to regFile
			if (RegWrite_ex == 1'b1) forwardCtrl = 2'b01;
			// send readRs through 
			else forwardCtrl = 2'b00;
			
			
		else if (writeAddr_Mem == Rvalue)
			//forward MemoryOutput. You are reading from memory
			if (writeEnable_mem == 1'b0) forwardCtrl = 2'b10;
			//send readRs through. You are writing to memory
			else forwardCtrl = 2'b00;
				
		else 
			//sent readRs through. 
			forwardCtrl = 2'b00;
	end 
	
endmodule 
	