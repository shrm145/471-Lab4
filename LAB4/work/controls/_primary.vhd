library verilog;
use verilog.vl_types.all;
entity controls is
    port(
        Branch          : out    vl_logic;
        Jump            : out    vl_logic;
        JR              : out    vl_logic;
        ALUSource       : out    vl_logic;
        ALUControl      : out    vl_logic_vector(1 downto 0);
        RegWrite        : out    vl_logic;
        MemWrite        : out    vl_logic;
        MemToReg        : out    vl_logic;
        RegDest         : out    vl_logic;
        instruction     : in     vl_logic_vector(31 downto 0)
    );
end controls;
