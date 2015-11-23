library verilog;
use verilog.vl_types.all;
entity dataPathTEST is
    port(
        regValues       : out    vl_logic_vector(31 downto 0);
        regRS           : out    vl_logic_vector(29 downto 0);
        negative        : out    vl_logic;
        WriteData_out   : out    vl_logic_vector(31 downto 0);
        readRs_out      : out    vl_logic_vector(31 downto 0);
        readRt_out      : out    vl_logic_vector(31 downto 0);
        WriteRegAddr_out: out    vl_logic_vector(4 downto 0);
        ALUoutput_out   : out    vl_logic_vector(31 downto 0);
        Rs              : in     vl_logic_vector(4 downto 0);
        Rt              : in     vl_logic_vector(4 downto 0);
        Rd              : in     vl_logic_vector(4 downto 0);
        imm16           : in     vl_logic_vector(15 downto 0);
        Branch          : in     vl_logic;
        ALUSource       : in     vl_logic;
        RegWrite        : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemToReg        : in     vl_logic;
        RegDest         : in     vl_logic;
        ALUControl      : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic
    );
end dataPathTEST;
