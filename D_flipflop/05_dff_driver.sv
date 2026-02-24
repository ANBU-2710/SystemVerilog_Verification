class driver;
  
  virtual dff_if.drv vif;
  mailbox gen2drv;
  
  function new(virtual dff_if.drv vif, mailbox gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
  task start;
    
    transaction tr;

    repeat(10)begin
    
      @(posedge vif.clk);
      gen2drv.get(tr);
      vif.rst = tr.rst;
      vif.d = tr.d;
      tr.display("driver");
      #3;
    end
    
  endtask
  
endclass
      
