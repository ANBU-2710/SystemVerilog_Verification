`include "dff_transaction.sv"
`include "dff_scoreboard.sv"
`include "dff_agent.sv"

class environment;
  
  virtual dff_if vif;
  
  agent agent_en;
  scoreboard sco_en;
  
  function new(virtual dff_if vif);
    
    this.vif = vif;
    agent_en = new(vif);
    sco_en = new(agent_en.mon2sco);
    
  endfunction
  
  task start;
    
    fork
      agent_en.start();
      sco_en.start();
    join_none
    
  endtask
  
endclass
