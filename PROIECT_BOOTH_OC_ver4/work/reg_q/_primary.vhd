library verilog;
use verilog.vl_types.all;
entity reg_q is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        c0              : in     vl_logic;
        c1              : in     vl_logic;
        c5              : in     vl_logic;
        shift_inc       : in     vl_logic_vector(1 downto 0);
        inbus           : in     vl_logic_vector(7 downto 0);
        q               : out    vl_logic_vector
    );
end reg_q;
