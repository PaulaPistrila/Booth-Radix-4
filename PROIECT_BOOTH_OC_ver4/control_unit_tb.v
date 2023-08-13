module _testbench;
  reg clk, reset, start;
  reg [2:0]q_lsb;
  wire final;
  wire c0, c1, c2, c3, c4, c5, c6, c7;

  // Instantiate the Unit Under Test (UUT)
  reg_fsm uut (
    .clk(clk), 
    .reset(reset), 
    .start(start), 
    .q_lsb(q_lsb), 
    .final(final),
    .c0(c0),
    .c1(c1),
    .c2(c2),
    .c3(c3),
    .c4(c4),
    .c5(c5),
    .c6(c6),
    .c7(c7)
  );

initial 
begin
  clk=0;
  repeat(200)#10 clk = ~clk;
end

  initial begin
    // Initialize Inputs
    reset = 0;
    start = 0;

    // Wait 100 ns for global reset to finish
    #100 reset = 1;

    // Test case 1 - q_lsb = 3'b000
#10 start = 1;
#10 q_lsb = 3'b000;
#10 q_lsb = 3'b000;
#10 q_lsb = 3'b000;
#10 q_lsb = 3'b000;
#10 q_lsb = 3'b000;
#10 q_lsb = 3'b111;
#10 q_lsb = 3'b111;
#10 q_lsb = 3'b111;
#10 q_lsb = 3'b111;
#10 start = 0;
#10 $display("Test case 1 - final = %b", final);

// Test case 2 - q_lsb = 3'b001
start = 1;
#10 q_lsb = 3'b001;
#10 q_lsb = 3'b001;
#10 q_lsb = 3'b001;
#10 q_lsb = 3'b001;
#10 q_lsb = 3'b001;
#10 q_lsb = 3'b110;
#10 q_lsb = 3'b110;
#10 q_lsb = 3'b110;
#10 q_lsb = 3'b110;
#10 start = 0;
#10 $display("Test case 2 - final = %b", final);
// Test case 3 - q_lsb = 3'b010
start = 1;
#10 q_lsb = 3'b010;
#10 q_lsb = 3'b010;
#10 q_lsb = 3'b010;
#10 q_lsb = 3'b010;
#10 q_lsb = 3'b010;
#10 q_lsb = 3'b101;
#10 q_lsb = 3'b101;
#10 q_lsb = 3'b101;
#10 q_lsb = 3'b101;
#10 start = 0;
#10 $display("Test case 3 - final = %b", final);

// Test case 4 - q_lsb = 3'b011
start = 1;
#10 q_lsb = 3'b011;
#10 q_lsb = 3'b011;
#10 q_lsb = 3'b011;
#10 q_lsb = 3'b011;
#10 q_lsb = 3'b011;
#10 q_lsb = 3'b100;
#10 q_lsb = 3'b100;
#10 q_lsb = 3'b100;
#10 q_lsb = 3'b100;
#10 start = 0;
#10 $display("Test case 4 - final = %b", final);

// Test case 5 - q_lsb = 3'b100
start = 1;
#10 q_lsb = 3'b100;
#10 q_lsb = 3'b100;
#10 q_lsb = 3'b100;
#10 q_lsb = 3'b100;
#10 q_lsb = 3'b100;
#10 q_lsb = 3'b011;
#10 q_lsb = 3'b011;
#10 q_lsb = 3'b011;
#10 q_lsb = 3'b011;
#10 start = 0;
#10 $display("Test case 5 - final = %b", final);

// Test case 6 - q_lsb = 3'b101
start = 1;
#10 q_lsb = 3'b101;
#10 q_lsb = 3'b101;
#10 q_lsb = 3'b101;
#10 q_lsb = 3'b101;
#10 q_lsb = 3'b101;
#10 q_lsb = 3'b010;
#10 q_lsb = 3'b010;
#10 q_lsb = 3'b010;
#10 q_lsb = 3'b010;
#10 start = 0;
#10 $display("Test case 6 - final = %b", final);

// Test case 7 - q_lsb = 3'b110
start = 1;
#10 q_lsb = 3'b110;
#10 q_lsb = 3'b110;
#10 q_lsb = 3'b110;
#10 q_lsb = 3'b110;
#10 q_lsb = 3'b110;
#10 q_lsb = 3'b001;
#10 q_lsb = 3'b001;
#10 q_lsb = 3'b001;
#10 q_lsb = 3'b001;
#10 start = 0;
#10 $display("Test case 7 - final = %b", final);

// Test case 8 - q_lsb = 3'b111
start = 1;
#10 q_lsb = 3'b111;
#10 q_lsb = 3'b111;
#10 q_lsb = 3'b111;
#10 q_lsb = 3'b111;
#10 q_lsb = 3'b111;
#10 q_lsb = 3'b000;
#10 q_lsb = 3'b000;
#10 q_lsb = 3'b000;
#10 q_lsb = 3'b000;
#10 start = 0;
#10 $display("Test case 8 - final = %b", final);

    // End simulation
    #100 ;
  end

  

endmodule
