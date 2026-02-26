// Code your testbench here
// or browse Examples
`include "dff_interface.sv"
`include "dff_test.sv"

module dff_tb;
  
  
  dff_if inf();
  test test_tb(inf);
  d_ff dff_dut(inf.dut);
  
  initial inf.clk = 0;
  always #5 inf.clk = ~inf.clk;
  
  initial begin
    $display();
    #1000;
    $finish;
  end
  
  initial begin
    $dumpfile("dff.vcd");
    $dumpvars();
  end
  
endmodule




/*
------generator------
rst = 1,d = 0, q = 0
------generator------
rst = 0,d = 1, q = 0
------driver------
rst = 1,d = 0, q = 0
------monitor------
rst = 1,d = 0, q = 0
scoreboard passed
------generator------
rst = 1,d = 1, q = 0
------generator------
rst = 1,d = 0, q = 0
------driver------
rst = 0,d = 1, q = 0
------monitor------
rst = 0,d = 1, q = 0
scoreboard fail
------generator------
rst = 0,d = 0, q = 0
------generator------
rst = 0,d = 1, q = 0
------driver------
rst = 1,d = 1, q = 0
------monitor------
rst = 1,d = 1, q = 1
scoreboard fail
------generator------
rst = 1,d = 1, q = 0
------generator------
rst = 1,d = 0, q = 0
------driver------
rst = 1,d = 0, q = 0
------monitor------
rst = 1,d = 0, q = 0
scoreboard passed
------generator------
rst = 0,d = 1, q = 0
------generator------
rst = 0,d = 0, q = 0
------driver------
rst = 0,d = 0, q = 0
------monitor------
rst = 0,d = 0, q = 0
scoreboard passed
------driver------
rst = 0,d = 1, q = 0
------monitor------
rst = 0,d = 1, q = 0
scoreboard fail
------driver------
rst = 1,d = 1, q = 0
------monitor------
rst = 1,d = 1, q = 1
scoreboard fail
------driver------
rst = 1,d = 0, q = 0
------monitor------
rst = 1,d = 0, q = 0
scoreboard passed
------driver------
rst = 0,d = 1, q = 0
------monitor------
rst = 0,d = 1, q = 0
scoreboard fail
------driver------
rst = 0,d = 0, q = 0
------monitor------
rst = 0,d = 0, q = 1
scoreboard fail
*/
