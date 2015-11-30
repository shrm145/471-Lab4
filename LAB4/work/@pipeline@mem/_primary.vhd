library verilog;
use verilog.vl_types.all;
entity PipelineMem is
    port(
        RegDest_wr      : out    vl_logic;
        RegWrite_wr     : out    vl_logic;
        RegDest_mem     : in     vl_logic;
        RegWrite_mem    : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end PipelineMem;
