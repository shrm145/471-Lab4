library verilog;
use verilog.vl_types.all;
entity alu is
    generic(
        WIDTH           : integer := 32
    );
    port(
        Output          : out    vl_logic_vector;
        zero            : out    vl_logic;
        overflow        : out    vl_logic;
        CarryOut        : out    vl_logic;
        negative        : out    vl_logic;
        BussA           : in     vl_logic_vector;
        BussB           : in     vl_logic_vector;
        ALUControl      : in     vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end alu;
