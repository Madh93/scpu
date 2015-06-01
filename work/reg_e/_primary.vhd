library verilog;
use verilog.vl_types.all;
entity reg_e is
    generic(
        WIDTH           : integer := 8
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        rwe             : in     vl_logic;
        d               : in     vl_logic_vector;
        q               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
end reg_e;
