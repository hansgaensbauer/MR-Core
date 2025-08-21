`timescale 1ns / 1ps

module uart_tb (
    );
    
    //System Interface
    logic rst_i;
    logic clk_i;  
    logic rxd;
    
    wire [7:0] rx_data;
    wire rx_data_ready;
    
    wire sck_internal;
    logic tb_sck_rst;
    clockdiv #(10) uart_clkdv (
        .CLK_IN(clk_i),
        .CLK_OUT(sck_internal),
        .RST_IN(tb_sck_rst)
    );
    
    //Instantiate the DUT
    uart dut (.*);
    
    task uart_send(
        input [7:0] DATA_IN
    );
        begin
            @(posedge sck_internal); rxd <= 1'b1;
            @(posedge sck_internal); rxd <= 1'b0;
            @(posedge sck_internal); rxd <= DATA_IN[0];
            @(posedge sck_internal); rxd <= DATA_IN[1];
            @(posedge sck_internal); rxd <= DATA_IN[2];
            @(posedge sck_internal); rxd <= DATA_IN[3];
            @(posedge sck_internal); rxd <= DATA_IN[4];
            @(posedge sck_internal); rxd <= DATA_IN[5];
            @(posedge sck_internal); rxd <= DATA_IN[6];
            @(posedge sck_internal); rxd <= DATA_IN[7];
            @(posedge sck_internal); rxd <= 1'b1;
        end
    endtask
    
    initial begin
        clk_i <= 0;
        forever
            #5 clk_i <= ~clk_i;
    end
    
    initial begin
        tb_sck_rst <= 1'b1;
        rxd <= 1'b1;
        #10;
        tb_sck_rst <= 1'b0;
        #68;
        rst_i <= 1; 
        @(negedge clk_i); @(negedge clk_i); rst_i <= 0;
        uart_send(8'b10101010);
        #15;
        uart_send(8'b11111111);
        #50;
        uart_send(8'b00111100);
        $finish;
    end
    
endmodule