module _reg_file_tb;
  reg[7:0]inbus;
  reg clk, reset, start;
  wire final;
  wire [8:0]outbus;
  
 // integer i=0;
  
  reg_file file(
  .inbus(inbus),
  .clk(clk),
  .reset(reset),
  .start(start),
  .final(final),
  .outbus(outbus)
  );
  
initial 
begin
  clk = 0;
  repeat(100)#10 clk = ~clk;
end
      
    initial begin
    reset = 1;
    start = 0;
    #20 reset = 0;
    #20 reset=1;
    #20 start = 1;
      #20 inbus=6; //q lsb=110
      #20 inbus=8; //q lsb = 000
      //#20 inbus=15; //q lsb = 111
      //#20 inbus=10; //q lsb=010
      //#20 inbus=7;
           /* #20 inbus=6; //q lsb=110
      #20 inbus=8; //q lsb = 000
            #20 inbus=6; //q lsb=110
      #20 inbus=8; //q lsb = 000
            #20 inbus=6; //q lsb=110
      #20 inbus=8; //q lsb = 000
            #20 inbus=6; //q lsb=110
      #20 inbus=8; //q lsb = 000
            #20 inbus=6; //q lsb=110
      #20 inbus=8; //q lsb = 000
            #20 inbus=6; //q lsb=110
      #20 inbus=8; //q lsb = 000 */
      $display("outbus=%d ", outbus);
      #200 start=0;
      
      end
      
endmodule 
  


