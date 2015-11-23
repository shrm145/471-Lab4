library verilog;
use verilog.vl_types.all;
entity instrFU_testbench is
    generic(
        ClockDelay      : integer := 2147483647
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ClockDelay : constant is 1;
end instrFU_testbench;
