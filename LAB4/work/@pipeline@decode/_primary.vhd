library verilog;
use verilog.vl_types.all;
entity PipelineDecode is
    port(
        ALUSrc_ex       : out    vl_logic;
        Branch_ex       : out    vl_logic;
        ALUControl0_ex  : out    vl_logic;
        ALUControl1_ex  : out    vl_logic;
        MemWrite_ex     : out    vl_logic;
        MemToReg_ex     : out    vl_logic;
        RegDest_ex      : out    vl_logic;
        RegWrite_ex     : out    vl_logic;
        ALUSrc_dec      : in     vl_logic;
        Branch_dec      : in     vl_logic;
        ALUControl0_dec : in     vl_logic;
        ALUControl1_dec : in     vl_logic;
        MemWrite_dec    : in     vl_logic;
        MemToReg_dec    : in     vl_logic;
        RegDest_dec     : in     vl_logic;
        RegWrite_dec    : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end PipelineDecode;
