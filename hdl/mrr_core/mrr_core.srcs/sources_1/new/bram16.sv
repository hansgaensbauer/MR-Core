`timescale 1ns / 1ps

module bram16 #(parameter DEPTH = 4)(
    input clk,
    input [$clog2(DEPTH)-1:0] addr,
    inout [15:0] data,
    input cs,
    input we, 
    input oe
    );
    
    logic [15:0] data_buf;
    logic [15:0] ram [0:DEPTH-1];
    
    always_ff @(posedge clk) begin
        if(cs & we) ram[addr] <= data;
        if(cs &!we) data_buf <= ram[addr];
    end
    
    assign data = cs & oe & !we ? data_buf : 16'bZ;

endmodule
