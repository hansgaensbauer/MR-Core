`timescale 1ns / 1ps

module prog_dds_tb(

    );
    
    logic CLK, RST;
    logic [16:0] freq;
    logic [15:0] phase;
    logic [15:0] amplitude;
    logic [15:0] dds_output;


    prog_dds DUT(.*);
    
    initial begin
        CLK <= 1'b0;
        forever begin
            #5;
            CLK <= ~CLK;
        end
    end
    
    initial begin
        #2;
        RST <= 1'b1;
        freq <= 15'd500;
        phase <= 15'b0;
        amplitude <= 15'd500;
        #15;
        RST <= 1'b0;
        
    end
endmodule
