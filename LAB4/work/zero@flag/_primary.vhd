library verilog;
use verilog.vl_types.all;
entity zeroFlag is
    port(
        \out\           : out    vl_logic;
        \in\            : in     vl_logic_vector(31 downto 0)
    );
end zeroFlag;
