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


//Forwarding Psuedo Code for Rs: (same for Rt though...)

// calculate writeAddr_Ex
if (regDest_Ex == 0)
	writeAddr_Ex = Rt_Ex;
else 
	writeAddr_Ex = Rd_Ex;
	
// calculate writeAddr_Mem
if (regDest_Mem == 0)
	writeAddr_Mem = Rt_Mem;
else 
	writeAddr_Mem = Rd_Mem;

if (Rs == 0) 
	//sent readRs through. Do not forward zero reg

// check if same address
else if (writeAddr_Ex == Rs && writeAddr_Mem == Rs)
	//forward ALUOutput. if both are same address forward most recent (Ex)
	
else if (writeAddr_Ex == Rs)
	//forward ALUOutput
	
else if (writeAddr_Mem == Rs)
	if (writeEnable_mem = FALSE)
		//forward MemoryOutput. You are reading from memory
	else
		//send readRs through. You are writing to memory
		
else 
	//sent readRs through. 
	