`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"


class environment;
  virtual fifo_inf vif;
  transaction tr;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sco;
  
  mailbox #(transaction) gen2drv;
  mailbox #(transaction) mon2sco;
  
  function new(virtual fifo_inf vif);
    this.vif = vif;
    
    gen2drv = new();
    mon2sco = new();
    
    gen = new(gen2drv);
    drv = new(vif,gen2drv);
    mon = new(vif,mon2sco);
    sco = new(mon2sco);
    
  endfunction
  
  task run_components();
    fork 
      drv.run();
      mon.run();
      sco.run();
    join_none
  endtask
  
endclass                  
