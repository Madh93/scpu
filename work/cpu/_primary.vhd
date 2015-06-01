library verilog;
use verilog.vl_types.all;
entity cpu is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        e1              : in     vl_logic_vector(7 downto 0);
        e2              : in     vl_logic_vector(7 downto 0);
        e3              : in     vl_logic_vector(7 downto 0);
        e4              : in     vl_logic_vector(7 downto 0);
        s1              : out    vl_logic_vector(7 downto 0);
        s2              : out    vl_logic_vector(7 downto 0);
        s3              : out    vl_logic_vector(7 downto 0);
        s4              : out    vl_logic_vector(7 downto 0);
        opcode          : out    vl_logic_vector(5 downto 0);
        operacion       : out    vl_logic_vector(2 downto 0);
        z               : out    vl_logic
    );
end cpu;
