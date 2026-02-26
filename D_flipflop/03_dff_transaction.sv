class transaction;
  
  rand bit rst;
  rand bit d;
  bit q;
  
  function void display(string name);
    $display("------%0s------",name);
    $display("rst = %0d,d = %0d, q = %0d",rst,d,q);
  endfunction
  
endclass
