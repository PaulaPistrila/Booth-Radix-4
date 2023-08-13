library verilog;
use verilog.vl_types.all;
entity booth_radix_4 is
    generic(
        w               : integer := 8
    );
    port(
        M               : in     vl_logic_vector;
        Q               : in     vl_logic_vector;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        count           : in     vl_logic_vector;
        produs          : out    vl_logic_vector
    );
end booth_radix_4;
