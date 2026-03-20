// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"

module testbench;
  logic clk;
  logic reset;
  
  fifo_inf inf(clk, reset);
  
  sync_fifo #(.DEPTH(16),.WIDTH(8),.ADDR(4)) dut( 
    .clk(inf.clk),
    .reset(inf.reset),
    .wr_en(inf.wr_en),
    .rd_en(inf.rd_en),
    .data_in(inf.data_in),
    .data_out(inf.data_out),
    .full(inf.full),
    .empty(inf.empty),
    .almost_full(inf.almost_full),
    .almost_empty(inf.almost_empty)
  );
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  
  
  //test_cases
  
  reset_test rst_t;
  write_test wr_t;
  read_test rd_t;
  full_test full_t;
  empty_test empty_t;
  overflow_test over_t;
  underflow_test under_t;
  rw_almost_full_test rw_af_t;
  
  
  task run_specific_test(base_test t);
    reset = 1;
    inf.wr_en = 0;
    inf.rd_en = 0;
    inf.data_in = 0;
    #20;
    reset = 0;
    @(negedge clk);
    t.run();
  endtask
  
  initial begin
    $display("------------------------------------------------------------------");
    $display("---starting the test for SYNC FIFO with selfchecking scoreboard---");
    $display("------------------------------------------------------------------");
    
    rst_t = new(inf);
    run_specific_test(rst_t);
    
    wr_t = new(inf);
    run_specific_test(wr_t);
    
    rd_t = new(inf);
    run_specific_test(rd_t);
    
    full_t = new(inf);
    run_specific_test(full_t);
    
    empty_t = new(inf);
    run_specific_test(empty_t);
    
    over_t = new(inf);
    run_specific_test(over_t);
    
    under_t = new(inf);
    run_specific_test(under_t);
    
    rw_af_t = new(inf);
    run_specific_test(rw_af_t);
    
    
    $display("------------------------------------------------------------------");
    $display("-------------all the tests are completed successfully-------------");
    $display("------------------------------------------------------------------");
    
    $finish;
    
  end
  
  initial begin
    
    $dumpfile("fifo.vcd");
    $dumpvars(0, testbench);
    
  end
  
endmodule
