class driver;
  transaction tr;
  mailbox #(transaction) gen2drv;
  virtual fifo_inf vif;
  
  function new(virtual fifo_inf vif, mailbox #(transaction) gen2drv);
    this.vif = vif;
    this.gen2drv = gen2drv;
  endfunction
  
  task run();
    forever begin
      gen2drv.get(tr);
      @(vif.drv_cb);
      vif.drv_cb.wr_en <= tr.wr_en;
      vif.drv_cb.rd_en <= tr.rd_en;
      vif.drv_cb.data_in <= tr.data_in;
//       tr.display("DRV");
    end
  endtask
  
endclass
