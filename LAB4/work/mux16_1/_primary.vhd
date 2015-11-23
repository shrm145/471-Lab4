library verilog;
use verilog.vl_types.all;
entity mux16_1 is
    generic(
        WIDTH           : integer := 4
    );
    port(
        \out\           : out    vl_logic;
        \in\            : in     vl_logic_vector(15 downto 0);
        sel             : in     vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end mux16_1;
