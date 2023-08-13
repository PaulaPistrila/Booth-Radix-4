library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        c0              : in     vl_logic;
        c5              : in     vl_logic;
        count           : out    vl_logic_vector(1 downto 0)
    );
end counter;
