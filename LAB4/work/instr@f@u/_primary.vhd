library verilog;
use verilog.vl_types.all;
entity instrFU is
    port(
        instruction     : out    vl_logic_vector(31 downto 0);
        Jump            : in     vl_logic;
        JR              : in     vl_logic;
        Branch          : in     vl_logic;
        negative        : in     vl_logic;
        imm16           : in     vl_logic_vector(15 downto 0);
        jumpTarget      : in     vl_logic_vector(25 downto 0);
        regRS           : in     vl_logic_vector(29 downto 0);
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end instrFU;
