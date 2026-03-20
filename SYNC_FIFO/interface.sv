interface fifo_inf(input logic clk, input logic reset);
  
//   logic clk;
//   logic reset;
  
  //input ports 
  logic wr_en;
  logic rd_en;
  logic[7:0] data_in;
  
  //output ports 
  logic full;
  logic empty;
  logic[7:0] data_out;
  logic almost_full;
  logic almost_empty;
  
  //clocking block 
  
  //driver
  clocking drv_cb @(posedge clk);
    output wr_en, rd_en, data_in;
    input data_out, full, empty, almost_full, almost_empty;
  endclocking
  
  //monitor
  clocking mon_cb @(posedge clk);
    input wr_en, rd_en, data_in;
    input data_out, full, empty, almost_full, almost_empty;
  endclocking
  
endinterface
