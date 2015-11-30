library verilog;
use verilog.vl_types.all;
entity register32Bit_testbench is
    generic(
        WIDTH           : integer := 32;
        period          : integer := 100
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of period : constant is 1;
end register32Bit_testbench;
