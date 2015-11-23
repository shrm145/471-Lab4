library verilog;
use verilog.vl_types.all;
entity adder30Bit_testbench is
    generic(
        WIDTH           : integer := 30
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end adder30Bit_testbench;
