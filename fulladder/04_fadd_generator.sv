class generator;
  
  //int count;
  transaction tr;
  mailbox gen2drv;
  
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  task start();
    
    repeat(10)begin 
      tr =new();
      assert(tr.randomize);
      gen2drv.put(tr);
    end
    
  endtask
  
endclass