library verilog;
use verilog.vl_types.all;
entity Execute is
    port(
        memAddr         : out    vl_logic_vector(31 downto 0);
        storedRt2       : out    vl_logic_vector(31 downto 0);
        Rt_mem          : out    vl_logic_vector(4 downto 0);
        Rd_mem          : out    vl_logic_vector(4 downto 0);
        negative        : out    vl_logic;
        zero            : out    vl_logic;
        CarryOut        : out    vl_logic;
        overflow        : out    vl_logic;
        ALUControl      : in     vl_logic_vector(1 downto 0);
        toALU1          : in     vl_logic_vector(31 downto 0);
        toALU2          : in     vl_logic_vector(31 downto 0);
        storedRt1       : in     vl_logic_vector(31 downto 0);
        Rt_ex           : in     vl_logic_vector(4 downto 0);
        Rd_ex           : in     vl_logic_vector(4 downto 0);
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end Execute;
