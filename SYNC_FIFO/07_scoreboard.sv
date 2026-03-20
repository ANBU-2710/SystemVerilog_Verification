class scoreboard;
  
  mailbox #(transaction) mon2sco;
  
  int DEPTH = 16;
  
  logic [7:0] fifo[$];
  
  logic check_read = 0;
  logic [7:0] exp_rdata = 0;
  
  int total_checks = 0;
  int pass_checks = 0;
  
  string testcase_name = "";
  
  function new(mailbox #(transaction) mon2sco);
    this.mon2sco = mon2sco;
  endfunction
  
  task run();
    transaction tr;
    forever begin
      mon2sco.get(tr);
      verify_state(tr);
      verify_next_state(tr);
    end
  endtask
  
  function void verify_state(transaction tr);
    logic exp_full = (fifo.size()==DEPTH);
    logic exp_empty = (fifo.size()==0);
    logic exp_almost_full = (fifo.size() == DEPTH - 1);
    logic exp_almost_empty = (fifo.size() == 1);
    logic fail = 0;
    
    total_checks++;
    
    //---check the full---
    if(tr.full !== exp_full)begin
      $error("==scoreboard==[%s] |full mismatch|expected = %0b : actual = %0b",testcase_name,exp_full,tr.full);
      fail = 1;
    end
    else if(tr.full == 1'b1 && exp_full == 1'b1 && testcase_name !== "")begin
      $display("==scoreboard==[%s] |full condition success|expected = %0b : actual = %0b",testcase_name, exp_full, tr.full);
    end
    
    //---check the empty---
    if(tr.empty !== exp_empty)begin
      $error("==scoreboard==[%s] |empty mismatch|expected = %0d : actual = %0d",testcase_name,exp_empty,tr.empty);
      fail = 1;
    end
    else if(tr.empty == 1'b1 && exp_empty == 1'b1 && testcase_name !== "")begin
      $display("==scoreboard==[%s] |empty condition success|expected = %0b : actual = %0b",testcase_name,exp_empty,tr.empty);
    end
    
    
    //---check almost full--
    if(tr.almost_full !== exp_almost_full)begin
      $error("==scoreboard==[%s] |almost_full mismatch|expected = %0b : actual = %0b",testcase_name,exp_almost_full,tr.almost_full);
      fail = 1;
    end
    else if(tr.almost_full == 1'b1 && exp_almost_full == 1'b1 && testcase_name !== "")begin
      $display("==scoreboard==[%s] |almost_full condition success|expected = %0b : actual = %0b",testcase_name, exp_almost_full, tr.almost_full);
    end
    
    //---check the almost empty--
    if(tr.almost_empty !== exp_almost_empty)begin
      $error("==scoreboard==[%s] |almost_empty mismatch|expected = %0b : actual = %0b",testcase_name,exp_almost_empty,tr.almost_empty);
      fail = 1;
    end
    else if(tr.almost_empty == 1'b1 && exp_almost_empty == 1'b1 && testcase_name !== "")begin
      $display("==scoreboard==[%s] |almost_empty condition success|expected = %0b : actual = %0b",testcase_name, exp_almost_empty, tr.almost_empty);
    end
    
    //---check the read data---
    if(check_read && !exp_empty)begin
      if(tr.data_out !== exp_rdata)begin
        $error("==scoreboard==[%s] |data mismatch|expected = %0h : actual = %0h",testcase_name,exp_rdata,tr.data_out);
        fail = 1;
      end
      else if(exp_rdata == tr.data_out)begin
        $display("==scoreboard==[%s] |rdata matched successfully |expected = %0h : actual = %0h",testcase_name,exp_rdata,tr.data_out);
      end
    end
    
    //check the successfull check 
    
    if(!fail)begin
      pass_checks++;
    end
    
  endfunction
  
  //next_state--overflow--underflow--
  function void verify_next_state(transaction tr);
    check_read = 0;
    case({tr.wr_en, tr.rd_en})
      
      2'b10 : begin
        
        if(fifo.size() < DEPTH)begin
          fifo.push_back(tr.data_in);
        end
        else begin
          if(testcase_name == "overflow")begin
            $display("==scoreboard==[%s] | the overflow is avoided |",testcase_name);
          end
        end
        
      end
      
      2'b01 : begin
        if(fifo.size() > 0)begin
          exp_rdata = fifo.pop_front();
          check_read = 1;
        end
        else begin
          if(testcase_name == "underflow")begin
            $display("==scoreboard==[%s] | the underflow is avoided |",testcase_name);
          end
        end
      end
      
      2'b11 : begin
        
        if(fifo.size() == 0)begin
          if(testcase_name == "underflow")begin
            $display("==scoreboard==[%s] | the underflow is avoided on read |",testcase_name);
          end
          fifo.push_back(tr.data_in);
        end
        else if(fifo.size() == DEPTH)begin
          exp_rdata = fifo.pop_front();
          check_read = 1;
          if(testcase_name == "overflow")begin
            $display("==scoreboard==[%s] | the overflow is avoided on simultenous read write |",testcase_name);
          end
        end
        
        else begin
          if(testcase_name == "rw_almost_full")begin
            $display("==scoreboard==[%s] | the concurrent read write executed perfectly on partially full fifo  |",testcase_name);
          end
          exp_rdata = fifo.pop_front();
          fifo.push_back(tr.data_in);
          check_read = 1;
        end
      end
    endcase
    
  endfunction
  
endclass
        
