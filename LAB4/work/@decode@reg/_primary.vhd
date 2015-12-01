library verilog;
use verilog.vl_types.all;
entity DecodeReg is
    port(
        regRS           : out    vl_logic_vector(29 downto 0);
        toALU1          : out    vl_logic_vector(31 downto 0);
        toALU2          : out    vl_logic_vector(31 downto 0);
        storedRt1       : out    vl_logic_vector(31 downto 0);
        Rt_ex           : out    vl_logic_vector(4 downto 0);
        Rd_ex           : out    vl_logic_vector(4 downto 0);
        ALUSource       : in     vl_logic;
        Branch          : in     vl_logic;
        regWrite        : in     vl_logic;
        writeToReg      : in     vl_logic_vector(31 downto 0);
        Rd              : in     vl_logic_vector(4 downto 0);
        Rt              : in     vl_logic_vector(4 downto 0);
        Rs              : in     vl_logic_vector(4 downto 0);
        WriteRegAddr    : in     vl_logic_vector(4 downto 0);
        imm16           : in     vl_logic_vector(15 downto 0);
        writeData_fwd   : in     vl_logic_vector(31 downto 0);
        ALUoutput_fwd   : in     vl_logic_vector(31 downto 0);
        RsCtrl          : in     vl_logic_vector(1 downto 0);
        RtCtrl          : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end DecodeReg;
