class driver;
  virtual fadd_if.drv vif;
  mailbox gen2drv;
  
  function new(virtual fadd_if.drv vif, mailbox gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
  task start;
    
    transaction tr;
    //forever begin
    repeat(10)begin
      #1;
      gen2drv.get(tr);
     // @(posedge vif.clk);
      vif.a = tr.a;
      vif.b = tr.b;
      vif.c_in = tr.c_in;
    end
    
  endtask
  
endclass
  