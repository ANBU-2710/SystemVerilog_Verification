`include "fadd_interface.sv"

module fadd(fadd_if inf);
  
  assign {inf.c_out,inf.sum} = inf.a + inf.b + inf.c_in;
  
endmodule