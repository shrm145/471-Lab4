library verilog;
use verilog.vl_types.all;
entity nor32Bit is
    generic(
        WIDTH           : integer := 32
    );
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        in0             : in     vl_logic_vector(31 downto 0);
        in1             : in     vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end nor32Bit;
