library verilog;
use verilog.vl_types.all;
entity e_s is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        sec             : in     vl_logic;
        rwe1            : in     vl_logic;
        rwe2            : in     vl_logic;
        rwe3            : in     vl_logic;
        rwe4            : in     vl_logic;
        data_mem        : in     vl_logic_vector(7 downto 0);
        data_reg        : in     vl_logic_vector(7 downto 0);
        in1             : in     vl_logic_vector(7 downto 0);
        in2             : in     vl_logic_vector(7 downto 0);
        in3             : in     vl_logic_vector(7 downto 0);
        in4             : in     vl_logic_vector(7 downto 0);
        id_out          : in     vl_logic_vector(1 downto 0);
        id_in           : in     vl_logic_vector(1 downto 0);
        data_in         : out    vl_logic_vector(7 downto 0);
        out1            : out    vl_logic_vector(7 downto 0);
        out2            : out    vl_logic_vector(7 downto 0);
        out3            : out    vl_logic_vector(7 downto 0);
        out4            : out    vl_logic_vector(7 downto 0)
    );
end e_s;
