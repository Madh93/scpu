library verilog;
use verilog.vl_types.all;
entity retorno_reg is
    generic(
        WIDTH           : integer := 10
    );
    port(
        swe             : in     vl_logic;
        reset           : in     vl_logic;
        d               : in     vl_logic_vector;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end retorno_reg;
