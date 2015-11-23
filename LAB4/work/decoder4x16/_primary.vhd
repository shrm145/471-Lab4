library verilog;
use verilog.vl_types.all;
entity decoder4x16 is
    generic(
        WIDTH           : integer := 4
    );
    port(
        \out\           : out    vl_logic_vector(15 downto 0);
        \in\            : in     vl_logic_vector(3 downto 0);
        enable          : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end decoder4x16;
