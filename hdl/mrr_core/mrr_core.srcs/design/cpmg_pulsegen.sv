`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// This module produces waveforms for testing magnets using a single spin-echo.
// It runs one experiment per TR. sw_out is used to toggle the RF switch. trig_out
// is used as an external trigger for a signal generator producing the larmor
// frequency. capture_out is used as an external trigger for the oscilloscope.
//
//                    _____         ____________
// sw_out:        ___| ___ |_______| __________ |_________________________
// trig_out:      ____|   |_________|          |__________________________
//                                                             ______
// capture_out:   ____________________________________________|      |_____
//
// Expected RX:   _________||,,_______________________________,,||||,,____
//
//
//////////////////////////////////////////////////////////////////////////////////


module cpmg_pulsegen (
	input clk_i,
    
    //SPI Input from STM32
    input sck_i,
    input sdi_i,
    input ncs_i,
    
    output logic sys_rst,
    output logic sequence_active,
	output logic sw_o,
	output logic [15:0] amp,
	output logic [15:0] ftw,
	output logic [15:0] phase
	);
	
	localparam DEAD_TIME = 2;
	
	//////////////////////////////////////////////////////////////////
	//Configuration Registers
	//////////////////////////////////////////////////////////////////
	
		/* 
	Register MAP
	0  TE[7:0]
	1  TE[15:8]
	2  T180[7:0]
	3  T90[7:0]
	4  NECHO[7:0]
	5  NECHO[15:8]
	6  A90[7:0]
	7  A90[15:9]
	8  A180[7:0]
	9  A180[15:8]
	10 CTRL
	*/
	
	logic [7:0] regfile [0:12];
	
	logic  [15:0] te_i;
    logic [7:0] t180_i;
    logic [7:0] t90_i;
    logic [15:0] necho_i;
    logic trig;
    
    assign te_i = {regfile[1], regfile[0]};
    assign t180_i = regfile[2];
    assign t90_i = regfile[3];
    assign necho_i = {regfile[5], regfile[4]};
	assign trig = regfile[10][0];
	assign ftw = {regfile[12], regfile[11]};
	
	
	logic load_spi_data;
	logic [7:0] address;
	logic [7:0] data;
	
	spi_driver stm32_spi (
	   .clk_i(clk_i),
	   .rst_i(sys_rst),
	   .sck_i(sck_i),
	   .sdi_i(sdi_i),
	   .ncs_i(ncs_i),
	   .trig_o(load_spi_data),
	   .data_o({address, data}),
	   .ncs_edge_o(ncs_edge_o),
       .sck_edge_o(sck_edge_o),
       .sc_o(sc_o)
	);
	
	//////////////////////////////////////////////////////////////////
	//Pulse Generation Logic
	//////////////////////////////////////////////////////////////////
	logic pulse_o;
	logic sw_on, sw_off;
	logic pulse_on, pulse_off;
	 
    logic [15:0] counter;
    logic [6:0] microsecond_counter;
    
    logic [15:0] pulse_counter;
    logic [15:0] counter_top;
    logic [15:0] pulse_off_counter_threshold;
    logic [15:0] sw_off_counter_threshold;
    logic cpmg_en, cpmg_off;
    assign sequence_active = cpmg_en;
    
    logic [15:0] dac_value;
    
    //find edges to preserve sensitivity list
    logic last_trig, trig_edge;
    always_ff @(posedge clk_i) begin
        last_trig <= trig;
    end
    assign trig_edge = trig & ~last_trig;
    
    //timing control
    assign sw_on = (counter == 0) && cpmg_en;
    assign sw_off = (counter == sw_off_counter_threshold);
        
    assign pulse_on = (counter == DEAD_TIME) && cpmg_en;
    assign pulse_off = (counter == pulse_off_counter_threshold);
    
    //toggle the output signals in accordance with the timing signals
    always_ff @(posedge clk_i) begin
        sys_rst <= regfile[10][7]; //output reset is registered
        if (sys_rst) begin
            //Default regfile values
            regfile[0] <= 8'b0;
            regfile[1] <= 8'b00000010;
            regfile[2] <= 40;
            regfile[3] <= 20;
            regfile[4] <= 5;
            regfile[5] <= 0; 
            regfile[6] <= 0;
            regfile[7] <= 16'h55;
            regfile[8] <= 0;
            regfile[9] <= 16'hAA;
            regfile[10] <= 8'b0;
            regfile[11] <= 16'hAA;
            regfile[12] <= 8'b0;
            
            microsecond_counter <= 0;
            pulse_counter <= 16'b0;
            counter <= 0;
            sw_o <= 1'b0;
            pulse_o <= 1'b0;
            cpmg_en <= 1'b0;
            dac_value <= 16'b0;
            phase <= 16'b0;
            counter_top <= 16'b0;
            pulse_off_counter_threshold <= 16'b0;
            sw_off_counter_threshold <= 16'b0;
        end else begin
	        if(load_spi_data) regfile[address] <= data;
	        else regfile[10] <= 8'b0;
            if (trig_edge) begin
                cpmg_en <= 1'b1;
                dac_value <= {regfile[7], regfile[6]};
                counter_top <= t90_i + te_i/2 - t180_i/2;
                sw_off_counter_threshold <= 2*DEAD_TIME + t90_i;
                pulse_off_counter_threshold <= (DEAD_TIME + t90_i);
                phase <= 16'b0;
            end else if (cpmg_off) begin
                cpmg_en <= 1'b0;
                pulse_counter <= 16'b0;
                microsecond_counter <= 0;
                counter <= 0;
            end else cpmg_en <= cpmg_en;
            
            if (cpmg_en) begin
                microsecond_counter <= microsecond_counter + 1'b1;
                if (microsecond_counter == 119) begin
                    microsecond_counter <= 7'b0;
                    counter <= counter + 1'b1;
                    if(counter == counter_top) begin
                        counter <= 0;
                        counter_top <= te_i-1;
                        pulse_counter <= pulse_counter + 1'b1;
                        sw_off_counter_threshold <= (t180_i + 2*DEAD_TIME);
                        pulse_off_counter_threshold <= (t180_i+DEAD_TIME);
                    end
                end
                
                if (sw_on) sw_o <= 1'b1;
                else if (sw_off) begin
                    sw_o <= 1'b0;
                    dac_value <= {regfile[9], regfile[8]}; //switch to 180 amplitude
                    phase <= 16'd16384;
                end
                else sw_o <= sw_o;
                
                if (pulse_on) pulse_o <= 1'b1;
                else if (pulse_off) pulse_o <= 1'b0;
                else pulse_o <= pulse_o;
            end
        end
    end
    
    assign cpmg_off = (pulse_counter == necho_i);
    assign amp = pulse_o ? dac_value : 16'b0;

endmodule