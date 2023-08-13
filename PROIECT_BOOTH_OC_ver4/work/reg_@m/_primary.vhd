library verilog;
use verilog.vl_types.all;
entity reg_M is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        c0              : in     vl_logic;
        inbus           : in     vl_logic_vector(7 downto 0);
        q               : out    vl_logic_vector(7 downto 0)
    );
end reg_M;
