interface fadd_if;/*(input bit clk);*/
  logic a,b,c_in;
  logic sum,c_out;
  
  modport dut(input a,b,c_in, output sum,c_out);
  
  modport drv(output a,b,c_in, input sum,c_out);//,clk);
  
  modport mon(input a,b,c_in,sum,c_out);//,clk);
  
endinterface