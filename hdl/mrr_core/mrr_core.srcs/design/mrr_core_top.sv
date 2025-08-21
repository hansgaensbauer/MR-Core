`timescale 1ns / 1ps

module mrr_core_top(
    input logic FPGA_CLK,
    input logic SCK,
    input logic SEN,
    input logic SDI,
    output logic SDO,
    
    input logic ADC_CLKOUT,
    input logic [13:0] ADC_DA,
    input logic [13:0] ADC_DB,
    
    output logic [15:0] DAC_DA,
    output logic [15:0] DAC_DB,
    output logic DAC_PHSTR,
    
    inout logic [15:0] FSMC_D,
    input logic FMC_ALE,
    input logic FMC_CLE,
    input logic FMC_NCE,
    input logic FMC_NOE,
    input logic FMC_NWE,
    
    output logic [6:0] IO,
    output logic [1:0] SW,
    
    output logic [1:0] GRINX,
    output logic [1:0] GRINY,
    output logic [1:0] GRINZ,
    
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
	
	//Turn off gradients
	assign GRINX = 2'b0;
    assign GRINY = 2'b0;
    assign GRINZ = 2'b0;
	
	//Input Mapping
	logic rst, pulse_trigger, sck_i, sdi_i, seq_active;
	
	//synchronizer
	logic sck_sync1, sck_sync2, sdi_sync1, sdi_sync2;
	always_ff @(posedge FPGA_CLK) begin
	   sck_sync1 <= SCK;
	   sck_sync2 <= sck_sync1;
	   sck_i <= sck_sync2;
	   sdi_sync1 <= SDI;
	   sdi_sync2 <= sdi_sync1;
	   sdi_i <= sdi_sync2;
	end
	
	/////////////////////////////////////////////////////
	// Pulse Sequencing
	/////////////////////////////////////////////////////
    
    logic ncs_edge_o, sck_edge_o, sc_o;
    logic [23:0] ftw;
    logic [15:0] tx_phase;
    logic [15:0] tx_amp;
    logic prog, seq, spiload;
    mrc_sequencer mrc_sequencer_0(
       .clk_i(FPGA_CLK),
	   .sys_rst(rst),
	   .sequence_active(seq_active),
       .sck_i(sck_i),
       .sdi_i(sdi_i),
       .ncs_i(SEN),
       .sw_o(SW[0]),
	   .amp(tx_amp),
	   .phase(tx_phase),
	   .ftw(ftw),
	   .prog(prog),
	   .seq(seq),
	   .spiload(spiload)
    );
    
	prog_dds tx_dds(
	   .CLK(FPGA_CLK),
	   .RST(rst),
	   .freq(ftw),
	   .phase(tx_phase),
	   .amplitude(tx_amp),
	   .dds_output(DAC_DA)
	);

	assign DAC_PHSTR = 1'b0;
	assign SW[1] = ~SW[0];
    
	/////////////////////////////////////////////////////
	// Receive
	/////////////////////////////////////////////////////
	
	//receive interconnects
	logic [15:0] tdata_dc_real;
	logic [15:0] tdata_dc_imag;
	logic [15:0] adc_axi_tdata;
	logic ddc_data_valid, adc_axi_tvalid;
	
	//Gate writes to FIFO
	logic fifo_wen;
	assign fifo_wen = ddc_data_valid && seq_active;
	
     //Design Modules
     adc_to_axi adc_to_axi_0 (
        .ADC_DATA(ADC_DA),
        .CLK(FPGA_CLK),
        .RST(rst),
        .O_AXIS_TDATA(adc_axi_tdata),
        .O_AXIS_TVALID(adc_axi_tvalid)
    );
    
    logic [15:0] rx_phase;
    prog_phasegen rx_phasegen(
        .CLK(FPGA_CLK),
        .RST(rst),
        .freq(ftw),
        .phase(rx_phase)
    );
	
	mrr_ddc mrr_ddc_0(
        .CLK(FPGA_CLK),
        .I_AXIS_TDATA({16'b0,adc_axi_tdata}),
        .I_AXIS_TVALID(adc_axi_tvalid),
        .O_AXIS_TDATA_IMAG(tdata_dc_imag),
        .O_AXIS_TDATA_REAL(tdata_dc_real),
        .O_AXIS_TVALID(ddc_data_valid),
        .S_AXIS_PHASE_TDATA(rx_phase),
        .S_AXIS_PHASE_TVALID(1'b1)
    );

    //For testing FMC
    logic [28:0] counter;
	always @(posedge FPGA_CLK) begin
        counter <= counter + 1'b1;
	end
	
//	//For simulation only
//	initial begin
//	   counter <= 29'b0;
//	end
    
    logic [15:0] fifo_out;
    logic fmc_tready;
    fifo_generator_0 fifo_ip_0(
        .clk(FPGA_CLK), 
        .srst(rst), 
        .din({tdata_dc_imag, tdata_dc_real}), 
        .wr_en(fifo_wen), 
        .rd_en(fmc_tready), 
        .dout(fifo_out), 
        .full(), 
        .empty(),
        .prog_full(SDO)
        );
	
	axi_fmc_nand axi_fmc_nand_0(
        .ale(FMC_ALE),
        .cle(FMC_CLE),
        .fmc_data(FSMC_D),
        .nce(FMC_NCE),
        .noe(FMC_NOE),
        .nwe(FMC_NWE),
        .CLK(FPGA_CLK),
        .RST(rst),
        .I_AXIS_TDATA(fifo_out),
        .I_AXIS_TVALID(1'b1),
        .I_AXIS_TREADY(fmc_tready)
    );
	
	//Debugging output
    assign IO = {SEN, SW[0], sdi_i, SW[1], prog, seq, sck_i};

endmodule
