module _reg_q_tb;

  // Inputs
  reg clk;
  reg reset;
  reg c0;
  reg c1;
  reg c5;
  reg [1:0] shift_inc;
  reg [7:0] inbus;

  // Outputs
  wire [7:-1] q;

  // Instantiate the reg_q module
  reg_q regQ (
    .clk(clk),
    .reset(reset),
    .c1(c1),
    .c5(c5),
    .shift_inc(shift_inc),
    .inbus(inbus),
    .q(q),
    .c0(c0)
  );

  // Clock generation
  initial 
begin
  clk = 0;
  repeat(100)#20 clk = ~clk;
end

  // Testbench stimulus
  initial begin
    clk = 0;
    reset = 0;
    c1 = 0;
    c5 = 0;
    shift_inc = 0;
    inbus = 0;
    c0=1;
    #10 reset = 1; // Release reset after 10 time units
    #20 c1 = 0; 
    #20 inbus=1;
    #10 c1 = 1; 
    #20 inbus=2;
    #10 c5 = 1; 
    
    
    #10 shift_inc = 2'b10; // Set shift_inc to 2'b10
    #20 inbus=2;
    #20 inbus=3;
    #20 shift_inc = 2'b00; // Set shift_inc to 2'b00
    
  end

endmodule

