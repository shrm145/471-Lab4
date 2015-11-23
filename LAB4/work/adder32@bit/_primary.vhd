library verilog;
use verilog.vl_types.all;
entity adder32Bit is
    generic(
        WIDTH           : integer := 32
    );
    port(
        \out\           : out    vl_logic_vector;
        cout            : out    vl_logic;
        overflow        : out    vl_logic;
        in0             : in     vl_logic_vector;
        in1             : in     vl_logic_vector;
        ctrl            : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end adder32Bit;
