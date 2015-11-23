library verilog;
use verilog.vl_types.all;
entity PC_testbench is
    generic(
        period          : integer := 100000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of period : constant is 1;
end PC_testbench;
