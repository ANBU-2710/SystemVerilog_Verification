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
d = 1, q = 0
------generator------
d = 0, q = 0
------driver------
d = 1, q = 0
------monitor------
d = 1, q = 0
scoreboard fail

------generator------
d = 1, q = 0
------generator------
d = 1, q = 0
------driver------
d = 0, q = 0
------monitor------
d = 0, q = 1
scoreboard fail

------generator------
d = 0, q = 0
------generator------
d = 0, q = 0
------driver------
d = 1, q = 0
------monitor------
d = 1, q = 0
scoreboard fail

------generator------
d = 1, q = 0
------generator------
d = 1, q = 0
------driver------
d = 1, q = 0
------monitor------
d = 1, q = 1
scoreboard passed

------generator------
d = 0, q = 0
------generator------
d = 0, q = 0
------driver------
d = 0, q = 0
------monitor------
d = 0, q = 1
scoreboard fail

------driver------
d = 0, q = 0
------monitor------
d = 0, q = 0
scoreboard passed

------driver------
d = 1, q = 0
------monitor------
d = 1, q = 0
scoreboard fail

------driver------
d = 1, q = 0
------monitor------
d = 1, q = 1
scoreboard passed

------driver------
d = 0, q = 0
------monitor------
d = 0, q = 1
scoreboard fail

------driver------
d = 0, q = 0
------monitor------
d = 0, q = 0
scoreboard passed
