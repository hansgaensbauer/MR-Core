module clockdiv_tb();
  
  reg clk_in, rst_in;
  wire clk_out;
  
  clockdiv #(10) dut(
    .CLK_IN(clk_in),
    .RST_IN(rst_in),
    .CLK_OUT(clk_out)
  );
  
  initial begin    
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars;
    rst_in <= 1'b1;
    #10;
    rst_in <= 1'b0;
    #100;
    $finish;
  end
  
  initial begin
    clk_in <= 1'b0;
    #1;
    forever begin
      clk_in <= ~clk_in;
      #1;
    end
  end
endmodule
