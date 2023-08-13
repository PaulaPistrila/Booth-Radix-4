module counter(
  input c0,c5,
  output reg [1:0]count
  );

always @(posedge c0 or posedge c5) begin
  if(c0) 
    count <= 2'b0;
  if(c5)
    count<=count+1'b1;
end
  
endmodule