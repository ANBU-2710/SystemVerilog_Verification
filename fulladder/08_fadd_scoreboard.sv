class scoreboard;
  bit exp_sum;
  bit exp_c_out;
  
  mailbox mon2sco;
  
  function new(mailbox mon2sco);
     this.mon2sco = mon2sco;
  endfunction
  
  task start;
    transaction tr;
    //forever begin
    repeat(10)begin
      #3;
      
      //bit exp_sum;
      //bit exp_c_out;
      
      mon2sco.get(tr);
      
      exp_sum = tr.a ^ tr.b ^ tr.c_in;
      exp_c_out = (tr.a & tr.b) | (tr.b & tr.c_in) | (tr.c_in &  tr.a);
      
      if(tr.sum == exp_sum && tr.c_out == exp_c_out)begin
      //if({tr.c_out,tr.sum} == tr.a + tr.b + tr.c_in)begin
        $display("scoreboard pass");
      end
      else begin
        $display("scoreboard fail");
      end
      
    end
  endtask
  
endclass
