class scoreboard;
  
  mailbox mon2sco;
  
  function new(mailbox mon2sco);
    this.mon2sco = mon2sco;
  endfunction
  
  task start();
    
    transaction tr;
    
    repeat(10)begin
      
      mon2sco.get(tr);
      
      if((tr.rst == 1)&&(tr.q == 0))begin
        $display("scoreboard passed");
      end
      else if((tr.rst == 0)&&(tr.q == tr.d))begin
        $display("scoreboard passed");
      end
      
      else begin
        $display("scoreboard fail");
      end
      #3;
    end
    
  endtask
  
endclass
   
    
