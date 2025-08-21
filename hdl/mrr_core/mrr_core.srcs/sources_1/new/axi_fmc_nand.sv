`timescale 1ns / 1ps

module axi_fmc_nand(
    input logic ale,
    input logic cle,
    inout logic [15:0] fmc_data,
    input logic nce,
    input logic noe,
    input logic nwe,
    input CLK,
    input RST,
    input logic [15:0] I_AXIS_TDATA,
    input logic I_AXIS_TVALID,
    output logic I_AXIS_TREADY
    );
    
    logic noe_internal;
    synchronizer noe_sync(CLK, noe, noe_internal);
    
    //Detect rising edges of fmc_noe
    logic noe_last, noe_rising_edge;
    always @(posedge CLK) begin
        noe_last <= noe_internal;
        noe_rising_edge <= noe_internal && ~noe_last;
    end
    
    assign fmc_data = noe ? 16'bZ : I_AXIS_TDATA;
    assign I_AXIS_TREADY = noe_rising_edge;
    
endmodule
