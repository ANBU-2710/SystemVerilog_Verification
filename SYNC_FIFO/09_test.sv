`include "environment.sv"

class base_test;
  environment env;
  virtual fifo_inf vif;
  
  function new(virtual fifo_inf vif);
    this.vif = vif;
    env = new(vif);
  endfunction
  
  virtual task run();
    fork
      env.run_components();
    join_none
  endtask
  
  
  task setup_test(string name);
    env.sco.testcase_name = name;
    $display("=====running the test: %s=====",name);
  endtask
  
  task run_gen(transaction tr, int count, int delay);
    env.gen.tr = tr;
    env.gen.count = count;
    env.gen.run();
    #(delay);
  endtask
  
endclass

class reset_test extends base_test;
  
  function new(virtual fifo_inf vif);
    super.new(vif);
  endfunction
  
  task run();
    idle_tr tr_idl = new();
    super.run();
    setup_test("reset");
    run_gen(tr_idl, 2, 20);
    begin disable fork; end
  endtask
  
endclass


class write_test extends base_test;
  
  function new(virtual fifo_inf vif);
    super.new(vif);
  endfunction
  
  task run();
    write_tr tr_wr = new();
    super.run();
    setup_test("write");
    run_gen(tr_wr, 5, 100);
    begin disable fork; end
  endtask
  
endclass

class read_test extends base_test;
  
  function new(virtual fifo_inf vif);
    super.new(vif);
  endfunction
  
  task run();
    write_tr tr_wr = new();
    read_tr tr_rd = new();
    super.run();
    setup_test("read");
    run_gen(tr_wr, 5, 50);
    run_gen(tr_rd, 5, 100);
    begin disable fork; end
  endtask
  
endclass


class full_test extends base_test;
  
  function new(virtual fifo_inf vif);
    super.new(vif);
  endfunction
  
  task run();
    write_tr tr_wr = new();
    super.run();
    setup_test("full");
    run_gen(tr_wr, 16, 200);
    begin disable fork; end
  endtask
  
endclass


class empty_test extends base_test;
  
  function new(virtual fifo_inf vif);
    super.new(vif);
  endfunction
  
  task run();
    write_tr tr_wr = new();
    read_tr tr_rd = new();
    super.run();
    setup_test("empty");
    run_gen(tr_wr, 10, 100);
    run_gen(tr_rd, 10, 150);
    begin disable fork; end
  endtask
  
endclass


class overflow_test extends base_test;
  
  function new(virtual fifo_inf vif);
    super.new(vif);
  endfunction
  
  task run();
    write_tr tr_wr = new();
    super.run();
    setup_test("overflow");
    run_gen(tr_wr, 20, 250);
    begin disable fork; end
  endtask
  
endclass



class underflow_test extends base_test;
  
  function new(virtual fifo_inf vif);
    super.new(vif);
  endfunction
  
  task run();
    write_tr tr_wr = new();
    super.run();
    setup_test("underflow");
    run_gen(tr_wr, 5, 100);
    begin disable fork; end
  endtask
  
endclass


class rw_almost_full_test extends base_test;
  
  function new(virtual fifo_inf vif);
    super.new(vif);
  endfunction
  
  task run();
    write_tr tr_wr = new();
    read_tr tr_rd = new();
    super.run();
    setup_test("rw_almost_full");
    run_gen(tr_wr, 15, 150);
    run_gen(tr_rd, 5, 100);
    begin disable fork; end
  endtask
  
endclass
    
