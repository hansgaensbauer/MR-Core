module clockdiv #(parameter N = 1048) (
  input CLK_IN,
  input RST_IN,
  output reg CLK_OUT
);
  
  reg [$clog2(N/2):0] counter;
  
  always @(posedge CLK_IN) begin
  	if(RST_IN) begin
    	counter <= 0;
      	CLK_OUT <= 1'b0;
  	end else begin
      if(counter == (N/2 - 1)) begin
        	counter <= 0;
        	CLK_OUT <= ~CLK_OUT;
      	end else begin
        	CLK_OUT <= CLK_OUT;
          	counter <= counter + 1'b1;
        end
  	end
  end
  
endmodule
