// Code your testbench here
// or browse Examples
//`include "fadd_interface.sv"
//`include "design.sv"
`timescale 1ns/1ps
`include "fadd_transaction.sv"
`include "fadd_generator.sv"
`include "fadd_driver.sv"
`include "fadd_monitor.sv"
`include "fadd_scoreboard.sv"
`include "fadd_agent.sv"
`include "fadd_environment.sv"

module fadd_tb;
  
  bit clk;
  always #5 clk = ~clk;
  
  fadd_if inf();/*(clk);*/
  fadd dut(inf);
  
  environment env;
  
  initial begin
    //clk = 0;
    env = new(inf);
    env.start();
    #200;
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
  
endmodule


/*
scoreboard pass
scoreboard pass
scoreboard pass
scoreboard pass
scoreboard pass
scoreboard pass
scoreboard pass
scoreboard pass
scoreboard pass
scoreboard pass
*/