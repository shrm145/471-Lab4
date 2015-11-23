library verilog;
use verilog.vl_types.all;
entity dataPathTEST_testbench is
    generic(
        ClockDelay      : integer := 10000000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ClockDelay : constant is 1;
end dataPathTEST_testbench;
