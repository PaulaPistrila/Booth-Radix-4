module _reg_A_tb;

  // Inputs
  reg clk;
  reg reset;
  reg c5;
  reg c2;
  reg [8:0] sum;
  reg c0;

  // Outputs
  wire [8:0] rez_A;
  

  // Instantiate the reg_A module
  reg_A regA (
    .clk(clk),
    .reset(reset),
    .c5(c5),
    .c2(c2),
    .sum(sum),
    .rez_A(rez_A),
    .c0(c0)
  );

  // Clock generation
  initial 
begin
  clk = 0;
  repeat(50)#20 clk = ~clk;
end

  // Testbench stimulus
  initial begin
    reset = 0;
    c5 = 0;
    c2 = 0;
    sum = 0;
    c0=1;
    #10 reset = 1; // Release reset after 10 time units
    #20 sum=1;
    #10 c2 = 1; 
    #20 sum=15;
    #20 c5=1;
    #20 sum=12;
    #20 c5=0;
    #20 c2=1;
    #20 sum=10;
    
  end

endmodule

