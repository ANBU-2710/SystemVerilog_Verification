class generator;
  transaction tr;
  mailbox #(transaction) gen2drv;
  int count;
  
  function new(mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task run();
    for(int i = 0; i < count; i++)begin
      if(!tr.randomize())
        $fatal("Gen: Randomization failed");
//       tr.display("GEN");
      gen2drv.put(tr.copy());
    end
  endtask
  
endclass
