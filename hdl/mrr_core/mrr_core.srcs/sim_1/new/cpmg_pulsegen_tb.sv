`timescale 1ns / 1ps

module cpmg_pulsegen_tb(

    );
    
    logic clk_i;
    
    logic sck_i, sdi_i, ncs_i; //SPI output from STM32
    
    logic sys_rst, sequence_active; //CPMG Trigger
    
	logic sw_o;
	logic [15:0] amp;
	logic [15:0] ftw;
	logic [15:0] phase;
	
	cpmg_pulsegen dut (.*);
	
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
                #100; 
                sck_i <= 1'b1; 
                #100;
            end
            for (int i = 7; i >= 0; i--) begin
                sck_i <= 1'b0; 
                data_i <= data_i<<1; 
                sdi_i <= data_i[7];
                #100; 
                sck_i <= 1'b1; 
                #100;
            end
            #50; ncs_i <= 1'b1;
        end
    endtask
	
	initial begin
        clk_i <= 0;
        forever
            #4.16666 clk_i <= ~clk_i;
    end
    
    initial begin
//        trig_i <= 1'b0;
        #100;
        ncs_i <= 1'b1;
        sck_i <= 1'b1;
        sdi_i <= 1'b0;
        #100;
        spi_send(10, 8'b10000000); //reset the chip
        #100;
        
        spi_send(0, 8'b00100000);
        #200;
        spi_send(1, 8'b00000000);
        #200;
        spi_send(2, 4);
        #200;
        spi_send(3, 2);
        #200;
        spi_send(4, 5);
        #200;
        spi_send(5, 0);
        #200;
        spi_send(6, 0);
        #200;
        spi_send(7, 8'h55);
        #200;
        spi_send(8, 0);
        #200;
        spi_send(9, 8'hAA);
        #200;
        spi_send(11, 0);
        #200;
        spi_send(12, 8'h1);
        #400;
        
        
        spi_send(10, 8'b00000001);
    end
endmodule
