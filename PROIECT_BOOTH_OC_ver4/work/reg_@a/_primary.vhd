library verilog;
use verilog.vl_types.all;
entity reg_A is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        c0              : in     vl_logic;
        c2              : in     vl_logic;
        c5              : in     vl_logic;
        sum             : in     vl_logic_vector(8 downto 0);
        rez_A           : out    vl_logic_vector(8 downto 0)
    );
end reg_A;
