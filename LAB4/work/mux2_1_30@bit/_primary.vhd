library verilog;
use verilog.vl_types.all;
entity mux2_1_30Bit is
    generic(
        WIDTH           : integer := 30
    );
    port(
        \out\           : out    vl_logic_vector;
        in0             : in     vl_logic_vector;
        in1             : in     vl_logic_vector;
        sel             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end mux2_1_30Bit;
