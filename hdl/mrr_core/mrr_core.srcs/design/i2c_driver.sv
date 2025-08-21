`timescale 1ns / 1ps

module i2c_driver #(parameter CLOCKDIV = 10) (
    //System Interface
    input [7:0] c_addr_i,
    input [15:0] data_i,
    input [15:0] addr_i,
    input trig_i,
    input clk_i,
    input rst_i,
    
    //I2C Output
    inout scl_z,
    inout sda_z
    );
    
    //registers for holding data
    logic [7:0] c_addr_reg;
    logic [15:0] data_reg;
    logic [15:0] addr_reg;
    
    wire scl_internal, scl_rst;
    clockdiv #(CLOCKDIV) spi_clkdv (
        .CLK_IN(clk_i),
        .CLK_OUT(scl_internal),
        .RST_IN(scl_rst)
    );
  
    //find edges to preserve sensitivity list
    logic last_scl, scl_negedge;
    always_ff @(posedge clk_i) begin
        last_scl <= scl_internal;
    end
    assign scl_negedge = ~scl_internal & last_scl;
  
  //controller
    enum {IDLE, START1, START2, SEND, ACK, STOP1, STOP2} ps, ns;
    
    //outputs from datapath
    logic byte_done, xfer_done;
    
    always_comb begin
        ns = ps;
        case (ps)
            IDLE:    if (trig_i)                    ns = START1;
            START1:  if (scl_negedge)               ns = START2;
            START2:  if (scl_negedge)               ns = SEND;
            SEND:    if (byte_done & scl_negedge)   ns = ACK;
            ACK:     if (xfer_done & scl_negedge)   ns = STOP1;
                     else if (scl_negedge)          ns = SEND;
            STOP1:   if (scl_negedge)               ns = STOP2;
            STOP2:   if (scl_negedge)               ns = IDLE;
        endcase
        if(rst_i) ns = IDLE;
    end
    
    //datapath input signals
    logic load_active_byte, clear_byte_counter;
    assign load_active_byte = (ps != SEND & ns == SEND);
    assign clear_byte_counter = (ps == STOP2 & ns == IDLE);
    assign scl_rst = trig_i | rst_i | (ps == IDLE);
    
    //datapath
    logic [2:0] byte_counter;
    logic [2:0] shift_counter;
    logic [7:0] active_byte;
    
    //datapath output signals
    assign byte_done = (shift_counter == 3'b111);
    assign xfer_done = (byte_counter == 3'b101);
    
    //output assignments
    logic sda_internal;
    always_comb begin
        if (ps == START1 | ps == START2) sda_internal = 1'b0;
        else if (ps == ACK | ps == IDLE) sda_internal = 1'b1;
        else sda_internal = active_byte[7];
    end
    assign sda_z = sda_internal ? 1'bZ : 1'b0;
    
    logic scl_z_driven;
    always_comb begin
        if (ps == START2 | ps == STOP1) scl_z_driven = 1'b0;
        else if (ps == SEND | ps == ACK) scl_z_driven = scl_internal;
        else scl_z_driven = 1'b1;
    end
    assign scl_z = scl_z_driven ? 1'bZ : 1'b0;
    
    always @(posedge clk_i) begin
        active_byte <= active_byte;
        byte_counter <= byte_counter;
        shift_counter <= shift_counter;
        c_addr_reg <= c_addr_reg;
        addr_reg <= addr_reg;
        data_reg <= data_reg;
        ps <= ps;
        if(rst_i) begin
            byte_counter <= 3'b0;
            shift_counter <= 3'b0;
            ps <= IDLE;
            c_addr_reg <= 8'b0;
            addr_reg <= 15'b0;
            data_reg <= 15'b0;            
        end
        else begin
            ps <= ns;
            if(trig_i) begin
                c_addr_reg <= c_addr_i;
                addr_reg <= addr_i;
                data_reg <= data_i;
            end
            if(scl_negedge) begin
                if(load_active_byte) begin
                    case (byte_counter)
                        3'b000: active_byte <= c_addr_reg;
                        3'b001: active_byte <= addr_reg[15:8];
                        3'b010: active_byte <= addr_reg[7:0];
                        3'b011: active_byte <= data_reg[15:8];
                        3'b100: active_byte <= data_reg[7:0];
                    endcase
                    byte_counter <= byte_counter + 1'b1;
                end 
                else if (ps == SEND) begin
                    active_byte <= active_byte << 1;
                    shift_counter <= shift_counter + 1'b1;
                end
                if(clear_byte_counter)
                    byte_counter <= 4'b0;
            end
        end
    end
    
endmodule
