module parallel_adder_tb;
 // Inputs
 reg [8:0] reg_A;
 reg [8:0] reg_M;
 reg c4, c3;
 // Outputs
 wire [8:0] sum;

 // Instantiate the Unit Under Test (UUT)
 parallel_adder pary (
  .reg_A(reg_A), 
  .reg_M(reg_M),
  .c4(c4),
  .c3(c3),
  .sum(sum)
 );
integer i, j;
 initial begin
   c3=0;
   c4=0;
  // Initializarea am realizat-o luand toate combinattile de numere de 8 biti
  for(i=0;i<256;i=i+1) begin
    for(j=0;j<256;j=j+1) begin
         reg_M = i;
         reg_A = j;
         #100;
end
end
 
 end
      
endmodule