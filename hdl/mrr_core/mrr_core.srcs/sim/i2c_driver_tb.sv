`timescale 1ns / 1ps

module i2c_driver_tb (
    );
    
    //System Interface
    logic [7:0] c_addr_i;
    logic [15:0] data_i;
    logic [15:0] addr_i;
    logic trig_i;
    logic clk_i;
    logic rst_i;
    
    //SPI Output
    wire sda_z, scl_z;
    
    pullup(sda_z);
    pullup(scl_z);
    
    //Instantiate the DUT
    i2c_driver #(10) dut (.*);
    
    initial begin
        clk_i <= 0;
        forever
            #5 clk_i <= ~clk_i;
    end
    
    initial begin
        rst_i <= 1; 
        trig_i <= 0;
        c_addr_i <= 8'b11001011;
        data_i <= 16'b1010101100001111;
        addr_i <= 16'b1111000011110000;      @(posedge clk_i);
        rst_i <= 0;                 @(posedge clk_i);
                                    @(posedge clk_i);
                                    @(posedge clk_i);
        trig_i <= 1;                @(posedge clk_i);
        trig_i <= 0;                @(posedge clk_i);
    end
    
endmodule