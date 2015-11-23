library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        outPC           : out    vl_logic_vector(29 downto 0);
        inPC            : in     vl_logic_vector(29 downto 0);
        reset           : in     vl_logic;
        clk             : in     vl_logic
    );
end PC;
