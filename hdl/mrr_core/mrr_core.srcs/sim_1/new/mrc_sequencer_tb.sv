`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2024 12:40:15 PM
// Design Name: 
// Module Name: mrc_sequencer_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mrc_sequencer_tb();
    
    logic clk_i;
    
    //SPI Input from STM32
    logic sck_i;
    logic sdi_i;
    logic ncs_i;
    
    logic sys_rst;
    logic sequence_active;
	logic sw_o;
	logic [15:0] amp;
	logic [23:0] ftw;
	logic [15:0] phase;
	logic [1:0] grinx;
    logic [1:0] griny;
    logic [1:0] grinz;
    
    logic prog;
    logic seq;
    logic spiload;
    
    mrc_sequencer dut(.*);

    reg [15:0] spi_data_int;
    
	task spi_send(input logic [15:0] data);
        begin
            for (int i = 15; i >= 0; i--) begin
                sck_i <= 1'b0; 
                data <= data<<1; 
                sdi_i <= data[15];
                #20; 
                sck_i <= 1'b1; 
                #20;
            end
        end
    endtask
	
	initial begin
        clk_i <= 0;
        forever
            #4.16666 clk_i <= ~clk_i;
    end
    
    initial begin
        int f;
        reg result;
        #100;
        ncs_i <= 1'b1;
        sck_i <= 1'b1;
        sdi_i <= 1'b0;
        #100;
        
        ncs_i <= 1'b0; #50;
        spi_send(16'b10000000_10000000); //Reset command
        #50; ncs_i <= 1'b1;
        
        #100;
        
        ncs_i <= 1'b0; #50;
        spi_send(16'b11000000_00000000); //FTW Programming
        #50; ncs_i <= 1'b1;
        
        #100;
        
        ncs_i <= 1'b0; #50;
        spi_send(16'hAA_55); //FTW Programming
        #50; ncs_i <= 1'b1;
        
        ncs_i <= 1'b0; #50;
        spi_send(16'h66_AA); //FTW Programming
        #50; ncs_i <= 1'b1;
        
        #100;
        ncs_i <= 1'b0; #50;
        spi_send(52); //Command to start programming
        #100;
        
        f = $fopen("demo.mrc", "rb");
        if(f) $display("File was opened successfully : %0d", f);
        else $display("Fail");        
        result = $fread(spi_data_int,f,2);
        result = $fread(spi_data_int,f,2);
        while (! $feof(f)) begin
            spi_send({spi_data_int[7:0],spi_data_int[15:8]});
            #10;
            result = $fread(spi_data_int,f,2);
        end
     $fclose(f);
     #50; ncs_i <= 1'b1;
     #500; //Done programming: trigger the experiment
     ncs_i <= 1'b0; #50;
     spi_send(16'b10000000_00000010); //Trigger command
     #50; ncs_i <= 1'b1;
    end
endmodule
