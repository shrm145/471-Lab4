library verilog;
use verilog.vl_types.all;
entity adder30Bit is
    generic(
        WIDTH           : integer := 30
    );
    port(
        \out\           : out    vl_logic_vector;
        cin             : in     vl_logic;
        in0             : in     vl_logic_vector;
        in1             : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end adder30Bit;
