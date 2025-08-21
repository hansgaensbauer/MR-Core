`timescale 1ns / 1ps

//a uart transmitter for serial io
module uart #(parameter baud_period = 10)(
    input rst_i,
    input clk_i,    
    input rxd,
    output logic [7:0] rx_data,
    output rx_data_ready
    );
    
    wire sck_internal;
    clockdiv #(baud_period) uart_clkdv (
        .CLK_IN(clk_i),
        .CLK_OUT(sck_internal),
        .RST_IN(rst_i | start_bit_negedge)
    );
    
    enum {ready, busy} ps, ns; //states
    
    //shift counter
    logic [3:0] shift_counter;
    
    logic start_bit_negedge, start_bit_last;
    logic sck_internal_posedge, sck_internal_last;
    always_ff @(posedge clk_i) begin
        start_bit_last <= rxd;
        sck_internal_last <= sck_internal;
    end
    assign start_bit_negedge = start_bit_last & ~rxd;  //Falling edge
    assign sck_internal_posedge = sck_internal & ~sck_internal_last; //Rising edge
    
    //next state
    always_comb begin
        ns = ready;
        case(ps)
            ready: ns = start_bit_negedge ? busy : ready;
            busy: ns = (shift_counter == 4'b0) ? ready : busy;
        endcase
    end //always_comb
    
    //datapath control
    logic shift_in, clear;
    assign shift_in = ((ps == busy) & sck_internal_posedge);
    assign clear = (ps == ready & ns == busy);
    //shifting out
    always_ff @(posedge clk_i) begin
        ps <= ns;
        rx_data <= rx_data;
        shift_counter <= shift_counter;
        if(rst_i) begin
            ps <= ready;
            rx_data <= 8'b0;
            shift_counter <= 0;
        end 
        else if (clear) begin
            rx_data <= 8'b0;
            shift_counter <= 9;
        end
        else if(shift_in == 1'b1) begin
            rx_data <= {rxd, rx_data[7:1]};
            shift_counter <= shift_counter - 1'b1;
        end
    end //always_ff
    
    assign rx_data_ready = (shift_counter == 0);
    
endmodule //uart