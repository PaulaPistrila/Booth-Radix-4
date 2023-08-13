module reg_q (
  input clk, reset,c0,c1,c5, [1:0]shift_inc,
  //shift_inc biti de incarcat in MSB la deplasarea la dreapta
  input [7:0]inbus, 
  output reg [7:-1]q
  // q continutul registrului
  );
  
always @(posedge clk or negedge reset or posedge c1 or posedge c5 or posedge c0)
  begin
    if(!reset)
      q<=0;
  else
    if(c1) //semnalul c1
      q[7:0]<=inbus;
      
      if(c0)
        q[-1]<=1'b0;
        
    if(c5) //e semnalul c5
    begin
      q<=q>>2;
      q[7]<=shift_inc[1];
      q[6]<=shift_inc[0];
  end
end
endmodule


