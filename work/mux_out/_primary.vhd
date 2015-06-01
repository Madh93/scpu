library verilog;
use verilog.vl_types.all;
entity mux_out is
    generic(
        WIDTH           : integer := 8
    );
    port(
        e0              : in     vl_logic_vector;
        e1              : in     vl_logic_vector;
        s               : in     vl_logic;
        \reg_\          : in     vl_logic_vector(1 downto 0);
        d0              : out    vl_logic_vector;
        d1              : out    vl_logic_vector;
        d2              : out    vl_logic_vector;
        d3              : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end mux_out;
