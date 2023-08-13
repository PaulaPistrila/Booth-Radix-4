module reg_fsm(
  input clk, reset, start,
  input [2:0]q_lsb,
  output final,
  output c0, c1, c2, c3, c4, c5, c6, c7
  );

  wire [1:0]count_out; //iesirea de la counter
  wire _c0, _c1, _c2, _c3, _c4, _c5, _c6, _c7;
  wire _final;
  counter cnt(
    .count(count_out),
    .c0(_c0),
    .c5(_c5)
  );
  //control unit
  control_unit controlUnit(
  .clk(clk),
  .reset(reset),
  .count3(count_out[0]&count_out[1]), //poarta si de pe schema
  .q_lsb(q_lsb), //out_Q[1], out_Q[0], out_Q[-1]
  .final(_final),
  .start(start),
  .c0(_c0),
  .c1(_c1),
  .c2(_c2),
  .c3(_c3),
  .c4(_c4),
  .c5(_c5),
  .c6(_c6),
  .c7(_c7)
  );
  
  assign c0=_c0;
  assign c1=_c1;
  assign c2=_c2;
  assign c3=_c3;
  assign c4=_c4;
  assign c5=_c5;
  assign c6=_c6;
  assign c7=_c7;
  assign final=_final;
    
endmodule