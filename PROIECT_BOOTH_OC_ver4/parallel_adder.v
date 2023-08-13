   module parallel_adder (
    input [8:0] reg_A,reg_M,
    input c4, c3,
    output [8:0] sum     
  );

   wire  carry_out;
   wire [8:0] carry;
   reg [8:0]reg_M_aux;
   reg [8:0] dubluM;
   
   always@(posedge c3) begin 
     if(c3) begin //calculez 2M 
       dubluM<=reg_M<<1;
       dubluM[0]<=1'b0;
    end
  end
  
  always@(posedge c4 , negedge c3) begin
    
    if(c4 && !c3) //daca trebuie sa fac scadere
          reg_M_aux<=(~reg_M[8:0])+1'b1;//facem complementul lui M adica -M
        end
        
  always@(negedge c4 , negedge c3) begin  
    if(!c3 && !c4)
          reg_M_aux<=reg_M;
    end
    
     always@(posedge c4 , posedge c3) begin
    if(c4 && c3)
          reg_M_aux<=(~dubluM[8:0])+1'b1;//facem complementul lui 2M adica -2M
  end
  
   always@(posedge c3 , negedge c4) begin
    if(c3 && !c4)
          reg_M_aux<=dubluM;
 end
 

   genvar i;
   generate 
   for(i=0;i<9;i=i+1)
   begin
     if(i==0) 
       fulladder f(reg_A[0],reg_M_aux[0],1'b0,sum[0],carry[0]); //nu avem carry in la inceput, in loc celula HAC am folosit tot FAC, dar unde carry in e 0    
      else
       fulladder f(reg_A[i],reg_M_aux[i],carry[i-1],sum[i],carry[i]);
     end
     
  assign carry_out = carry[8];
   endgenerate
endmodule