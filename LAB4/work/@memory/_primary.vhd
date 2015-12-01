library verilog;
use verilog.vl_types.all;
entity Memory is
    port(
        writeData_fwd   : out    vl_logic_vector(31 downto 0);
        writeToReg      : out    vl_logic_vector(31 downto 0);
        Rt_wr           : out    vl_logic_vector(4 downto 0);
        Rd_wr           : out    vl_logic_vector(4 downto 0);
        MemWrite        : in     vl_logic;
        MemToReg        : in     vl_logic;
        memAddr         : in     vl_logic_vector(31 downto 0);
        storedRt2       : in     vl_logic_vector(31 downto 0);
        Rt_mem          : in     vl_logic_vector(4 downto 0);
        Rd_mem          : in     vl_logic_vector(4 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end Memory;
