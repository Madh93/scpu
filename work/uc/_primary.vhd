library verilog;
use verilog.vl_types.all;
entity uc is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        z               : in     vl_logic;
        id_out          : in     vl_logic_vector(1 downto 0);
        opcode          : in     vl_logic_vector(5 downto 0);
        s_inc           : out    vl_logic;
        s_inm           : out    vl_logic;
        we3             : out    vl_logic;
        rwe1            : out    vl_logic;
        rwe2            : out    vl_logic;
        rwe3            : out    vl_logic;
        rwe4            : out    vl_logic;
        sec             : out    vl_logic;
        s_es            : out    vl_logic;
        s_rel           : out    vl_logic;
        swe             : out    vl_logic;
        s_ret           : out    vl_logic;
        op              : out    vl_logic_vector(2 downto 0)
    );
end uc;
