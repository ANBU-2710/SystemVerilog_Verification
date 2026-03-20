class transaction;
  
  rand bit				wr_en;
  rand bit 				rd_en;
  rand bit [7:0]		data_in;
  
  bit[7:0]				data_out;
  bit					full;
  bit					empty;
  bit					almost_full;
  bit					almost_empty;
  
  function void display(string name);
    $display("---[%s]---",name);
    $display("wr_en=%0b rd_en=%0b data_in=%0h | data_out=%0h f=%0b e=%0b af=%0b ae=%0b", wr_en, rd_en, data_in, data_out, full, empty, almost_full, almost_empty); 
  endfunction
  
    
  virtual function transaction copy();
    transaction tr = new();
    tr.wr_en = this.wr_en;
    tr.rd_en = this.rd_en;
    tr.data_in = this.data_in;
    tr.data_out = this.data_out;
    tr.full = this.full;
    tr.empty = this.empty;
    tr.almost_full = this.almost_full;
    tr.almost_empty = this.almost_empty;
    return tr;
  endfunction
endclass

//constraints

//write
class write_tr extends transaction;
  
  constraint write_cons{wr_en == 1; rd_en == 0;}
  
  virtual function transaction copy();
    
    write_tr tr = new();
    tr.wr_en = this.wr_en;
    tr.rd_en = this.rd_en;
    tr.data_in = this.data_in;
    tr.data_out = this.data_out;
    tr.full = this.full;
    tr.empty = this.empty;
    tr.almost_full = this.almost_full;
    tr.almost_empty = this.almost_empty;
    return tr;
  endfunction
  
endclass

//read
class read_tr extends transaction;
  
  constraint read_cons{ wr_en == 0; rd_en == 1;}
  
  virtual function transaction copy();
    read_tr tr = new();
    tr.wr_en = this.wr_en;
    tr.rd_en = this.rd_en;
    tr.data_in = this.data_in;
    tr.data_out = this.data_out;
    tr.full = this.full;
    tr.empty = this.empty;
    tr.almost_full = this.almost_full;
    tr.almost_empty = this.almost_empty;
    return tr;
  endfunction
  
endclass

// //full
// class full_tx #(parameter WIDTH = 8) extends transaction #(WIDTH);
//   constraint full_cons{wr_en == 1; rd_en == 0;}
// endclass

// //empty
// class empty_tx #(parameter WIDTH = 8) extends transaction #(WIDTH);
//   constraint empty_cons{wr_en == 0; rd_en == 1;}
// endclass

// //overflow
// class overflow_tx #(parameter WIDTH = 8) extends transaction #(WIDTH);
//   constraint overflow_cons{wr_en == 1; rd_en == 0;}
// endclass

// //underflow
// class underflow_tx #(parameter WIDTH = 8) extends transaction #(WIDTH);
//   constraint overflow_cons{wr_en == 0; rd_en == 1;}
// endclass

//simultenous read and write
class rw_tr extends transaction;
  constraint rw_cons{wr_en == 1; rd_en == 1;}
  
  virtual function transaction copy();
    
    rw_tr tr = new();
    tr.wr_en = this.wr_en;
    tr.rd_en = this.rd_en;
    tr.data_in = this.data_in;
    tr.data_out = this.data_out;
    tr.full = this.full;
    tr.empty = this.empty;
    tr.almost_full = this.almost_full;
    tr.almost_empty = this.almost_empty;
    return tr;
  endfunction
  
endclass

//idle
class idle_tr extends transaction;
  constraint idle_cons{wr_en == 0; rd_en == 0; data_in == 0;}
  
  virtual function transaction copy();
    
    idle_tr tr = new();
    tr.wr_en = this.wr_en;
    tr.rd_en = this.rd_en;
    tr.data_in = this.data_in;
    tr.data_out = this.data_out;
    tr.full = this.full;
    tr.empty = this.empty;
    tr.almost_full = this.almost_full;
    tr.almost_empty = this.almost_empty;
    return tr;
  endfunction
  
endclass
    
// class random_tx #(parameter WIDTH = 8) extends transaction #(WIDTH);
//   constraint random_cons{ wr_en dist {1 := 50 ; 0 := 50}; rd_en dist {1 := 50 ; 0 := 50};}
// endclass
