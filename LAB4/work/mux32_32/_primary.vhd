library verilog;
use verilog.vl_types.all;
entity mux32_32 is
    generic(
        WIDTH           : integer := 32
    );
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        \in\            : in     vl_logic_vector(31 downto 0);
        sel             : in     vl_logic_vector(4 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end mux32_32;
