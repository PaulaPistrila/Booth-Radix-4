library verilog;
use verilog.vl_types.all;
entity parallel_adder is
    port(
        reg_A           : in     vl_logic_vector(8 downto 0);
        reg_M           : in     vl_logic_vector(8 downto 0);
        c4              : in     vl_logic;
        c3              : in     vl_logic;
        c2              : in     vl_logic;
        sum             : out    vl_logic_vector(8 downto 0)
    );
end parallel_adder;
