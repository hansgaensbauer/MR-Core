`timescale 1ns / 1ps

module mrr_core_top_tb;
    
    //System Interface
    logic FPGA_CLK;
    logic SCK;
    logic SEN;
    logic SDI;
    logic SDO;
    
    logic ADC_CLKOUT;
    logic [13:0] ADC_DA;
    logic [13:0] ADC_DB;
    
    logic [15:0] DAC_DA;
    logic [15:0] DAC_DB;
    logic DAC_PHSTR;
    
    wire [15:0] FSMC_D;
    logic FMC_ALE;
    logic FMC_CLE;
    logic FMC_NCE;
    logic FMC_NOE;
    logic FMC_NWE;
    
    logic [6:0] IO;
    logic [1:0] SW;
    
    logic [1:0] GRINX;
    logic [1:0] GRINY;
    logic [1:0] GRINZ;
    
    logic [3:0] USB_BE;
    wire [31:0] USB_DATA;
    logic USB_D_CLK;
    logic [1:0] USB_GPIO;
    logic USB_NOE;
    logic USB_NRD;
    logic USB_NRESET;
    logic USB_NRXF;
    logic USB_NSIWU;
    logic USB_NTXE;
    logic USB_NWAKEUP;
    logic USB_NWR;
	
	logic testbench_rst;
    
    //Instantiate the DUT
    mrr_core_top dut (.*);
    
    //ADC simulator
    adc_emulator adc_emulator_0(
        .DATA_A(ADC_DA),
        .DATA_B(ADC_DB)
    );

    task fmc_read();
        begin
            //Command
            @(negedge FPGA_CLK); 
            FMC_NCE <= 1'b0;
            @(negedge FPGA_CLK);
            //read
            FMC_NOE <= 1'b0;
            @(posedge FPGA_CLK);
            @(negedge FPGA_CLK);
            @(negedge FPGA_CLK);
            $display ("FMC Read: time=%0t, data=0x%0h", $time, FSMC_D); //Print the read data
            @(negedge FPGA_CLK);
            @(negedge FPGA_CLK);
            @(negedge FPGA_CLK);
            FMC_NOE <= 1'b1;
            @(negedge FPGA_CLK);
            FMC_NCE <= 1'b1;
            @(negedge FPGA_CLK); FMC_NCE <= 1'b1;

        end
    endtask
    
    reg [15:0] spi_data_int;
    
	task spi_send(input logic [15:0] data);
        begin
            for (int i = 15; i >= 0; i--) begin
                SCK <= 1'b0; 
                data <= data<<1; 
                SDI <= data[15];
                #20; 
                SCK <= 1'b1; 
                #20;
            end
        end
    endtask

    initial begin
        FPGA_CLK <= 0;
        forever
            #4.16666 FPGA_CLK <= ~FPGA_CLK;
    end
    
    initial begin
        $dumpfile("mrr_core.vcd");
        $dumpvars;
        FMC_ALE <= 1'b0;
        FMC_CLE <= 1'b0;
        FMC_NWE <= 1'b0;

        for (int i = 0; i < 10; i++) begin
            fmc_read();
            #2000;
        end

    end

    initial begin
        int f;
        reg result;
        #100;
        SEN <= 1'b1;
        SCK <= 1'b1;
        SDI <= 1'b0;
        #100;
        SEN <= 1'b0; #50;
        spi_send(16'b10000000_10000000); //Reset command
        #50; SEN <= 1'b1;
        
        #100;
        
        SEN <= 1'b0; #50;
        spi_send(16'b11000000_00000000); //FTW Programming
        #50; SEN <= 1'b1;
        #100;
        
        SEN <= 1'b0; #50;
        spi_send(16'b10001); //FTW Programming
        #50; SEN <= 1'b1;
        #100;
        
        SEN <= 1'b0; #50;
        spi_send(16'b0101001010011010); //FTW Programming
        
        #100;
        
        SEN <= 1'b0; #50;
        spi_send(33); //Command to start programming
        
        #100;
        
        f = $fopen("demo.mrc", "rb");
        if(f) $display("File was opened successfully : %0d", f);
        else $display("Fail");        
        result = $fread(spi_data_int,f,2);
        result = $fread(spi_data_int,f,2);
        while (! $feof(f)) begin
            spi_send({spi_data_int[7:0],spi_data_int[15:8]});
            #10;
            result = $fread(spi_data_int,f,2);
        end
     $fclose(f);
     #50; SEN <= 1'b1;
     #500; //Done programming: trigger the experiment
     SEN <= 1'b0; #50;
     spi_send(16'b10000000_00000010); //Trigger command
     #50; SEN <= 1'b1;
    end
    
endmodule