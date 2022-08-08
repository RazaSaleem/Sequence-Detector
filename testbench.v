// Code your testbench here
// or browse Examples
module seq_detet_tb;
  
  bit clk;
  reg rst;
  red data_in;
  wire out;
  
  //module instantiation
  
  seq_detector dut (.clk(clk), .rst(rst), .data_in(data_in), .out(out));
  
  //clork generation
  always #5 clk = ~clk;
  
  initial
    begin
      rst = 1;
      #10
      rst = 0;
      for (int i=0; i<100; i++)
        begin
          (negedge clk)
          data_in = $random;
        end
      rst = 1;
      #20
      rst = 0;
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #1100
      $finish;
    end
  
endmodule
