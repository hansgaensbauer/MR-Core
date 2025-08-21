`timescale 1ns / 1ps

module prog_phasegen(
    input CLK,
    input RST,
    input [23:0] freq,
    output [15:0] phase
    );
    
    logic [23:0] phase_internal;
    
    always_ff @(posedge CLK) begin
        if(RST) begin
            phase_internal <= 0;
        end else begin
            phase_internal <= phase_internal + freq;
        end
    end
    
    assign phase = phase_internal[23:8];
endmodule