library verilog;
use verilog.vl_types.all;
entity microc is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        s_inc           : in     vl_logic;
        s_inm           : in     vl_logic;
        we3             : in     vl_logic;
        s_es            : in     vl_logic;
        s_rel           : in     vl_logic;
        swe             : in     vl_logic;
        s_ret           : in     vl_logic;
        op              : in     vl_logic_vector(2 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        z               : out    vl_logic;
        opcode          : out    vl_logic_vector(5 downto 0);
        data_mem        : out    vl_logic_vector(7 downto 0);
        data_reg        : out    vl_logic_vector(7 downto 0);
        id_in           : out    vl_logic_vector(1 downto 0);
        id_out          : out    vl_logic_vector(1 downto 0)
    );
end microc;
