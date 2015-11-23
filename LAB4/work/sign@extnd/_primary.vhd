library verilog;
use verilog.vl_types.all;
entity signExtnd is
    port(
        outExtnd        : out    vl_logic_vector(31 downto 0);
        inExtnd         : in     vl_logic_vector(15 downto 0)
    );
end signExtnd;
