class transaction;
  
  bit rst;
  rand bit d;
  bit q;
  
  function void display(string name);
    $display("------%0s------",name);
    $display("d = %0d, q = %0d",d,q);
  endfunction
  
endclass
