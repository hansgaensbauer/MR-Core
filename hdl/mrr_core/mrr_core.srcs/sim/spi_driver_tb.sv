`timescale 1ns / 1ps

module spi_driver_tb (
    );
    
    //System Interface
    logic [15:0] data_o;
    logic trig_o, clk_i, rst_i;
    logic [4:0] shift_counter;
    
    //SPI Input
    logic sck_i, sdi_i, ncs_i;
    
    //Instantiate the DUT
    spi_driver dut (.*);
    
    
    	task spi_send(
        input logic [7:0] addr_i,
        input logic [7:0] data_i
    );
        begin
            ncs_i <= 1'b0; #50;
            for (int i = 7; i >= 0; i--) begin
                sck_i <= 1'b0; 
                addr_i <= addr_i<<1; 
                sdi_i <= addr_i[7];
                #10000; 
                sck_i <= 1'b1; 
                #10000;
            end
            for (int i = 7; i >= 0; i--) begin
                sck_i <= 1'b0; 
                data_i <= data_i<<1; 
                sdi_i <= data_i[7];
                #10000; 
                sck_i <= 1'b1; 
                #10000;
            end
            #50; ncs_i <= 1'b1;
        end
    endtask
	
	initial begin
        clk_i <= 0;
        forever
            #5 clk_i <= ~clk_i;
    end
    
    initial begin
        rst_i <= 1'b1; #1204;
        ncs_i <= 1'b1;
        sck_i <= 1'b0;
        sdi_i <= 1'b0;
        rst_i <= 1'b0;
        #1453;
        
        spi_send(0, 8'hE8);
        #20000;
        spi_send(1, 8'h03);
        #20000;
        spi_send(2, 40);
        #20000;
        spi_send(3, 20);
        #20000;
        spi_send(4, 5);
        #20000;
        spi_send(5, 0);
        #20000;
        spi_send(6, 0);
        #20000;
        spi_send(7, 55);
        #20000;
        spi_send(8, 0);
        #20000;
        spi_send(9, 55);
        
    end
    
endmodule