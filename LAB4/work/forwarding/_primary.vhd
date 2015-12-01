library verilog;
use verilog.vl_types.all;
entity forwarding is
    port(
        forwardCtrl     : out    vl_logic_vector(1 downto 0);
        Rt_ex           : in     vl_logic_vector(4 downto 0);
        Rd_ex           : in     vl_logic_vector(4 downto 0);
        Rt_mem          : in     vl_logic_vector(4 downto 0);
        Rd_mem          : in     vl_logic_vector(4 downto 0);
        regDest_Ex      : in     vl_logic;
        regDest_Mem     : in     vl_logic;
        writeEnable_mem : in     vl_logic;
        RegWrite_ex     : in     vl_logic;
        Rvalue          : in     vl_logic_vector(4 downto 0)
    );
end forwarding;
