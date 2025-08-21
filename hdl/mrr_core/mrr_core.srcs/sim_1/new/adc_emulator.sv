`timescale 1ns / 1ps

module adc_emulator(
        output logic [13:0] DATA_A,
        output logic [13:0] DATA_B
    );
    //16 bit holders
    reg [15:0] data_a_16;
    reg [15:0] data_b_16;
    
    assign DATA_A = data_a_16[13:0];
    assign DATA_B = data_b_16[13:0];

    initial begin
        int f;
        reg result;
        f = $fopen("adcvec.mem", "rb");
        if(f) $display("File was opened successfully : %0d", f);
        else $display("Fail");
        while (! $feof(f)) begin
            result = $fread(data_a_16,f,2);
            result = $fread(data_b_16,f,2);
            #4.16666; #4.16666;
        end
         $fclose(f);
         $finish;
    end
    
endmodule
