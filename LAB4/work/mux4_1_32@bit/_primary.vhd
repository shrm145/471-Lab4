library verilog;
use verilog.vl_types.all;
entity mux4_1_32Bit is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        in0             : in     vl_logic_vector(31 downto 0);
        in1             : in     vl_logic_vector(31 downto 0);
        in2             : in     vl_logic_vector(31 downto 0);
        in3             : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(1 downto 0)
    );
end mux4_1_32Bit;
