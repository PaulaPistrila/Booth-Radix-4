library verilog;
use verilog.vl_types.all;
entity Booth_mult is
    generic(
        N               : integer := 18
    );
    port(
        product         : out    vl_logic_vector;
        done            : out    vl_logic;
        mplier          : in     vl_logic_vector;
        mcand           : in     vl_logic_vector;
        n_reset         : in     vl_logic;
        start           : in     vl_logic;
        clk             : in     vl_logic
    );
end Booth_mult;
