//`include "dff_transaction.sv"
`include "dff_generator.sv"
`include "dff_driver.sv"
`include "dff_monitor.sv"

class agent;
  
  
  virtual dff_if vif;
  
  generator gen_ag;
  driver drv_ag;
  monitor mon_ag;
  
  mailbox gen2drv;
  mailbox mon2sco;
  
  function new(virtual dff_if vif);
    
    this.vif = vif;
    
    gen2drv = new();
    mon2sco = new();
    
    gen_ag = new(gen2drv);
    drv_ag = new(vif.drv,gen2drv);
    mon_ag = new(vif.mon,mon2sco);
    
  endfunction
  
  task start;
    
    fork
      
      gen_ag.start();
      drv_ag.start();
      mon_ag.start();
      
    join    
  endtask
  
endclass
