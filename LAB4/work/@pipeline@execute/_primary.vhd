library verilog;
use verilog.vl_types.all;
entity PipelineExecute is
    port(
        MemWrite_mem    : out    vl_logic;
        MemToReg_mem    : out    vl_logic;
        RegDest_mem     : out    vl_logic;
        RegWrite_mem    : out    vl_logic;
        MemWrite_ex     : in     vl_logic;
        MemToReg_ex     : in     vl_logic;
        RegDest_ex      : in     vl_logic;
        RegWrite_ex     : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end PipelineExecute;
