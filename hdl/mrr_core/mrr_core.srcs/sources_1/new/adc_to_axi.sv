`timescale 1ns / 1ps

module adc_to_axi(
    input [13:0] ADC_DATA,
    input CLK,
    input RST,
    output logic [15:0] O_AXIS_TDATA,
    output O_AXIS_TVALID
    );
    
    //FF Synchronizer
    logic [13:0] adc_data_reg;

    // Synchronize ADC data to the system clock domain
    always @(posedge CLK) begin
        if (RST) begin
            adc_data_reg <= 14'd0;
            O_AXIS_TDATA <= 16'd0;
        end else begin
            adc_data_reg <= ADC_DATA;
            O_AXIS_TDATA <= {2'b00, adc_data_reg};
        end
    end

    assign O_AXIS_TVALID = 1'b1;
 

endmodule
