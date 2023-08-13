module reg_M (
  input clk, reset, c0,
  input [7:0]inbus, //ld_inbus incarca valoarea deinmultitului din INBUS
  output reg [7:0]q  //continutul registrului
  );
  
always @(posedge clk or negedge reset or posedge c0)
  begin
    if(!reset)
      q<=0;
  else
    if(c0)
      q<=inbus;
end
endmodule
