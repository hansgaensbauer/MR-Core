`timescale 1ns / 1ps

module AXI_SIM_SOURCE #(parameter sourcefile = "csvec.mem")(
        output logic [15:0] O_AXIS_TDATA,
        output logic O_AXIS_TVALID
    );
    
    initial begin
        int f;
        reg result;
        f = $fopen(sourcefile, "r");
        if(f) $display("File was opened successfully : %0d", f);
        else $display("Fail");
        while (! $feof(f)) begin
            result = $fread(O_AXIS_TDATA,f,2);
            #10;
        end
         $fclose(f);
         $finish;
    end
    
    assign O_AXIS_TVALID = 1'b1;
    
endmodule
