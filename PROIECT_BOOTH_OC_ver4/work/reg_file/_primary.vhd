library verilog;
use verilog.vl_types.all;
entity reg_file is
    port(
        inbus           : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        final           : out    vl_logic;
        outbus          : out    vl_logic_vector(8 downto 0)
    );
end reg_file;
