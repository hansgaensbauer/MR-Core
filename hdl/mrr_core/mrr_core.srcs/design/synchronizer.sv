`timescale 1ns / 1ps

module synchronizer (
    input clk,
    input async_in,
    output logic sync_out
);

logic sync_1;

always_ff @(posedge clk) begin
    sync_1 <= async_in;
    sync_out <= sync_1;
end

endmodule