library verilog;
use verilog.vl_types.all;
entity mux is
    port(
        d0              : in     vl_logic_vector(8 downto 0);
        sel             : in     vl_logic;
        o               : out    vl_logic_vector(8 downto 0)
    );
end mux;
