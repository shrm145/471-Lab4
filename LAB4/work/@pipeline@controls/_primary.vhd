library verilog;
use verilog.vl_types.all;
entity PipelineControls is
    port(
        ALUSrc_out      : out    vl_logic;
        Branch_out      : out    vl_logic;
        ALUControl0_out : out    vl_logic;
        ALUControl1_out : out    vl_logic;
        MemWrite_out    : out    vl_logic;
        MemToReg_out    : out    vl_logic;
        RegDest_out     : out    vl_logic;
        RegWrite_out    : out    vl_logic;
        ALUSrc_in       : in     vl_logic;
        Branch_in       : in     vl_logic;
        ALUControl0_in  : in     vl_logic;
        ALUControl1_in  : in     vl_logic;
        MemWrite_in     : in     vl_logic;
        MemToReg_in     : in     vl_logic;
        RegDest_in      : in     vl_logic;
        RegWrite_in     : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end PipelineControls;
