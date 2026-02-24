// Code your design here
//`include "dff_interface.sv"

module d_ff(dff_if.dut inf);
  
  always@(posedge inf.clk)begin
    if(inf.rst)
      inf.q <= 1'b0;
    else
      inf.q <= inf.d;
  end
  
endmodule
