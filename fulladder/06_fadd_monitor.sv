class monitor;
  
  virtual fadd_if.mon vif;
  mailbox mon2sco;
  
  function new(virtual fadd_if.mon vif,mailbox mon2sco);
    this.vif = vif;
    this.mon2sco = mon2sco;
  endfunction
  
  task start;
    transaction tr;
    //forever begin
    repeat(10)begin
      #2;
    // @(posedge vif.clk);
      tr = new();
      tr.a = vif.a;
      tr.b = vif.b;
      tr.c_in = vif.c_in;
      tr.sum = vif.sum;
      tr.c_out = vif.c_out;
      mon2sco.put(tr);
    end
    
  endtask
  
endclass