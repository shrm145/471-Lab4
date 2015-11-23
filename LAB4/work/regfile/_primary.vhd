library verilog;
use verilog.vl_types.all;
entity regfile is
    generic(
        WIDTH           : integer := 32
    );
    port(
        regValues       : out    vl_logic_vector(31 downto 0);
        ReadData1       : out    vl_logic_vector(31 downto 0);
        ReadData2       : out    vl_logic_vector(31 downto 0);
        WriteData       : in     vl_logic_vector(31 downto 0);
        ReadRegister1   : in     vl_logic_vector(4 downto 0);
        ReadRegister2   : in     vl_logic_vector(4 downto 0);
        WriteRegister   : in     vl_logic_vector(4 downto 0);
        RegWrite        : in     vl_logic;
        clk             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end regfile;
