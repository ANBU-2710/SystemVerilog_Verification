interface dff_if;
  
  logic clk;
  logic rst;
  logic d;
  logic q;
  
  modport dut(input clk,rst,d, output q);
  modport drv(input q,clk,output rst,d);
  modport mon(input clk,rst,d,q);
  
  
endinterface
