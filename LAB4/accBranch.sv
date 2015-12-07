module accBranches(Branch, regRs);
	output Branch;
	input regRs;
	
	
	adder32Bit (.out, .cout, .overflow, .in0(regRs), .in1(32'b0), .ctrl(1'b1));
	
	
	assign Branch = out[31];