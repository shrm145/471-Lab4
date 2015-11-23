library verilog;
use verilog.vl_types.all;
entity dataPath is
    port(
        regRS           : out    vl_logic_vector(29 downto 0);
        negative        : out    vl_logic;
        zero            : out    vl_logic;
        CarryOut        : out    vl_logic;
        overflow        : out    vl_logic;
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
end dataPath;
