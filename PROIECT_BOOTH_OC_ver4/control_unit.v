module control_unit (
  input clk, reset, start, 
  input [2:0]q_lsb,
  input count3, //asta e si intre bitii modulului de count
  output reg final,
  output reg c0, c1, c2, c3, c4, c5, c6, c7
);

localparam S0=4'd0;
localparam S1=4'd1;
localparam S2=4'd2;
localparam S3=4'd3;
localparam S4=4'd4;
localparam S5=4'd5;
localparam S6=4'd6;
localparam S7=4'd7;
localparam S8=4'd8;
localparam S9=4'd9;
localparam S10=4'd10;

reg[3:0]st;
reg[3:0]st_next;

always@(*) begin
  case(st)
    S0: if(!start) st_next=S0;
      else begin 
      st_next=S1;
      end
      
    S1: st_next=S2;
  
    S2: st_next=S3;
    
    S3: if(q_lsb==3'b001 || q_lsb==3'b010)
          st_next=S4;
      else if(q_lsb==3'b101 || q_lsb==3'b110)
             st_next=S5;
           else if(q_lsb==3'b011)
             st_next=S6;
                else if(q_lsb==3'b100)
                  st_next=S7;
                     else if((q_lsb==3'b000 || q_lsb==3'b111) && count3==0)
                          st_next=S8;
                          else if((q_lsb==3'b000 || q_lsb==3'b111) && count3==1)
                               st_next=S9;
   
      
     S4: if(count3==1)
          st_next=S9;
       else st_next=S8;
      
    S5:  if(count3==1)
          st_next=S9;
       else st_next=S8;
  
    S6:  if(count3==1)
          st_next=S9;
       else st_next=S8;
          
    S7:   if(count3==1)
          st_next=S9;
       else st_next=S8;
      
    
    S8: if(count3==0)
        st_next=S3;
        
    S9: st_next=S10;
    
    S10: st_next=S0;
            
endcase
end

//calculez iesirile adica semnalele de control
always@(*) begin
          final=0;
          c0 = 0;
          c1 = 0;
          c2 = 0;
          c3 = 0;
          c4 = 0;
          c5 = 0;
          c6 = 0;
          c7 = 0;
  case(st)
    S0: begin final=0;
          c0 = 0;
          c1 = 0;
          c2 = 0;
          c3 = 0;
          c4 = 0;
          c5 = 0;
          c6 = 0;
          c7 = 0;
        end
    S1: c0=1;
    
    S2: c1=1;
    
    S4: c2=1;
    S5:begin c2=1; c4=1; end
    S6: begin c2=1; c3=1; end
    S7: begin c2=1; c3=1; c4=1; end
    S8: c5=1; 
    S9: c6=1; 
    S10: begin c7=1; final=1; end //start=0?
    
endcase
end

  always@(posedge clk , negedge reset) begin
    if(!reset) st<=S0;
    else st<=st_next;
  end

endmodule
