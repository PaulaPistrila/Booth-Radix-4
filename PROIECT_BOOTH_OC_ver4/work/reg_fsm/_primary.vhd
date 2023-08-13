library verilog;
use verilog.vl_types.all;
entity reg_fsm is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        q_lsb           : in     vl_logic_vector(2 downto 0);
        final           : out    vl_logic;
        c0              : out    vl_logic;
        c1              : out    vl_logic;
        c2              : out    vl_logic;
        c3              : out    vl_logic;
        c4              : out    vl_logic;
        c5              : out    vl_logic;
        c6              : out    vl_logic;
        c7              : out    vl_logic
    );
end reg_fsm;
