library verilog;
use verilog.vl_types.all;
entity DFF_32 is
    generic(
        WIDTH           : integer := 32
    );
    port(
        q               : out    vl_logic_vector;
        d               : in     vl_logic_vector;
        enable          : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end DFF_32;
