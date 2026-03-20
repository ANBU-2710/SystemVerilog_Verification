class monitor;
  transaction tr;
  mailbox #(transaction) mon2sco;
  virtual fifo_inf vif;
  
  function new(virtual fifo_inf vif, mailbox #(transaction) mon2sco);
    this.vif = vif;
    this.mon2sco = mon2sco;
  endfunction
  
  task run();
    forever begin
      @(vif.mon_cb);
      tr = new();
      tr.wr_en = vif.mon_cb.wr_en;
      tr.rd_en = vif.mon_cb.rd_en;
      tr.data_in = vif.mon_cb.data_in;
      
      tr.data_out = vif.mon_cb.data_out;
      tr.full = vif.mon_cb.full;
      tr.empty = vif.mon_cb.empty;
      tr.almost_full = vif.mon_cb.almost_full;
      tr.almost_empty = vif.mon_cb.almost_empty;
//       tr.display("MON");
      mon2sco.put(tr);
    end
  endtask
  
endclass
