library verilog;
use verilog.vl_types.all;
entity adder32Bit_testbench is
    generic(
        WIDTH           : integer := 32
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end adder32Bit_testbench;
