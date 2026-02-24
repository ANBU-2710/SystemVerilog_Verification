class monitor;
  
  virtual dff_if.mon vif;
  mailbox mon2sco;
  
  function new(virtual dff_if.mon vif, mailbox mon2sco);
    this.vif = vif;
    this.mon2sco = mon2sco;
  endfunction
  
  task start;
    transaction tr;
    repeat(10)begin
      
     tr = new();
      @(posedge vif.clk);
      tr.rst = vif.rst;
      tr.d = vif.d;
      tr.q = vif.q;
      tr.display("monitor");
      mon2sco.put(tr);
      #3;
    end
  endtask
  
endclass
