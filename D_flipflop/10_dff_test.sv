`include "dff_environment.sv"

program test(dff_if inf);
  
  environment env;
  
  initial begin
    env = new(inf);
    env.start();
    #2000;
  end
  
endprogram
