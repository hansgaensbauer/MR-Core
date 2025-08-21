`timescale 1ns / 1ps

module spi_driver (
    //System Interface
    output logic [15:0] data_o,
    output logic trig_o,
    input clk_i,
    input rst_i,
    
    //SPI Input
    input sck_i,
    input sdi_i,
    input ncs_i
    );
  
    //find edges to preserve sensitivity list
    logic last_sck, sck_edge;
    always_ff @(posedge clk_i) begin
        last_sck <= sck_i;
    end
    assign sck_edge = sck_i & ~last_sck;
    
    //find ncs edges to preserve sensitivity list
    logic last_ncs, ncs_edge;
    always_ff @(posedge clk_i) begin
        last_ncs <= ncs_i;
    end
    assign ncs_edge = last_ncs & ~ncs_i;
    
    //datapath
    logic [4:0] shift_counter;
    always_ff @(posedge clk_i) begin
        data_o <= data_o;
        trig_o <= 1'b0;
        shift_counter <= shift_counter;
        if(rst_i || ncs_edge) begin
            shift_counter <= 5'b0;
            trig_o <= 1'b0;
            data_o <= 16'b0;
        end else if (shift_counter == 5'b10000) begin
            shift_counter <= 5'b0;
            trig_o <= 1'b1;
        end else if (sck_edge && ~ncs_i) begin
            data_o <= {data_o[14:0], sdi_i};
            shift_counter <= shift_counter + 1'b1;
        end
    end

endmodule
