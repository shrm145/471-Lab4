library verilog;
use verilog.vl_types.all;
entity register32Bit is
    generic(
        WIDTH           : integer := 32
    );
    port(
        q               : out    vl_logic_vector;
        d               : in     vl_logic_vector;
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end register32Bit;
