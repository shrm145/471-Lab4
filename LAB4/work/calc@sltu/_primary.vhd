library verilog;
use verilog.vl_types.all;
entity calcSltu is
    port(
        sltu            : out    vl_logic;
        overflow        : in     vl_logic;
        negative        : in     vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic
    );
end calcSltu;
