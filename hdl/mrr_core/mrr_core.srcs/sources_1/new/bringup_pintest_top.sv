`timescale 1ns / 1ps

module bringup_pintest_top(
    input logic FPGA_CLK,
    output logic ADC_CLKOUT,
    input logic [13:0] ADC_DA,
    input logic [13:0] ADC_DB,
    
    output logic [15:0] DAC_DA,
    output logic [15:0] DAC_DB,
    output logic DAC_PHSTR,
    output logic DAC_TXEN,
    
    input logic [25:0] FSMC_A,
    inout logic [15:0] FSMC_D,
    output logic STM32_CLK_OUT,
    
    output logic [6:0] IO,
    output logic [1:0] SW,
    
    output logic [3:0] USB_BE,
    inout logic [31:0] USB_DATA,
    input logic USB_D_CLK,
    input logic [1:0] USB_GPIO,
    output logic USB_NOE,
    output logic USB_NRD,
    output logic USB_NRESET,
    output logic USB_NRXF,
    output logic USB_NSIWU,
    output logic USB_NTXE,
    output logic USB_NWAKEUP,
    output logic USB_NWR
    
    );
    
    //Assign alternating patterns for hardware testing
    
    assign DAC_DA = 16'b10101010_10101010;
    assign DAC_DB = 16'b10101010_10101010;
    
    assign FSMC_A = 26'b10_10101010_10101010_10101010;
    assign FSMC_D = 16'b10101010_10101010;
    
    assign IO = 7'b1010101;
    assign SW = 2'b11;
    
endmodule
