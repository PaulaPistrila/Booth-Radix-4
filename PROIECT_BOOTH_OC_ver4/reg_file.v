module reg_file(
  input[7:0]inbus,
  input clk, reset, start,
  output final,
  output reg [8:0]outbus
  );
  
  wire [8:0]out_adder; //iesire parallel adder
  wire [8:0]out_A; //iesire registru A
  wire [7:-1]out_Q; //iesire registru Q
  wire [7:0]out_M; //iesire registru M
  wire c0,c1,c2,c3,c4,c5,c6,c7; //semnalele de control care ies din fsm
  wire _final;
  
  //registrul A
  reg_A regA(
  .clk(clk),
  .reset(reset), //???????????????????????????????????????????
  .c5(c5), //semnalul c5
  .c2(c2), //semnalul c2
  .sum(out_adder),
  .rez_A(out_A),
  .c0(c0)
  );
  
  // registru Q
   reg_q regQ(
  .clk(clk),
  .reset(reset),
  .c5(c5), //semnalul c5
  .c1(c1), //semnalul c1
  .inbus(inbus),
  .shift_inc({out_A[1], out_A[0]}),
  .q(out_Q),
  .c0(c0)
  );

  //registru M
   reg_M regM(
  .clk(clk),
  .reset(reset),
  .c0(c0), //semnalul c0
  .inbus(inbus),
  .q(out_M)
  );

  //parallel adder
  parallel_adder parallelAdder(
  .reg_A(out_A),
  .reg_M({out_M[7],out_M[7:0]}),
  .sum(out_adder),
  .c4(c4),
  .c3(c3)
  );

  
  wire [1:0]count_out; //iesirea de la counter
  counter cnt(
    .count(count_out),
    .c0(c0),
    .c5(c5)
  );
  
  
  //control unit
  control_unit control_unit(
  .clk(clk),
  .reset(reset),
  .count3(count_out[0]&count_out[1]), //poarta si de pe schema
  .q_lsb({out_Q[1], out_Q[0], out_Q[-1]}), //out_Q[1], out_Q[0], out_Q[-1]
  .final(_final),
  .start(start),
  .c0(c0),
  .c1(c1),
  .c2(c2),
  .c3(c3),
  .c4(c4),
  .c5(c5),
  .c6(c6),
  .c7(c7)
  );
  
  //rezultatele de la outbus
  always @(posedge c6 or posedge c7) begin
    if(c6)
      outbus<=out_A;
    if(c7)
      outbus<=out_Q;
  end
assign final=_final;
endmodule
