module fmc_nand_tb ();

    //Clock
    logic clk;

    //DUT Signals
    logic ale;
    logic cle;
    logic [15:0] fmc_data_int;
    logic nce;
    logic noe;
    logic nwe;
    logic CLK;
    logic RST;
    logic [15:0] I_AXIS_TDATA;
    logic I_AXIS_TVALID;
    logic I_AXIS_TREADY;
    
    wire [15:0] fmc_data;
    assign fmc_data = noe ? fmc_data_int : 16'bZ;

    //DUT
    axi_fmc_nand dut (.*);
    
    assign I_AXIS_TVALID = 1'b1;
    assign I_AXIS_TDATA = 16'h5555;

    task fmc_read(
        input [15:0] address
    );
        begin
            //Command
            @(negedge clk); 
            nce <= 1'b0;
            cle <= 1'b1;
            nwe <= 1'b0;
            fmc_data_int <= 16'b0;

            @(posedge clk); 
            nwe <= 1'b1;
            fmc_data_int <= 16'bZ;

            //Address
            @(negedge clk);
            cle <= 1'b0;
            ale <= 1'b1;
            nwe <= 1'b0;
            fmc_data_int <= 16'hABCD;

            @(posedge clk);
            nwe <= 1'b1;
            fmc_data_int <= 16'bZ;

            //Command
            @(negedge clk);
            cle <= 1'b1;
            ale <= 1'b0;
            nwe <= 1'b0;
            fmc_data_int <= 16'h30;

            @(posedge clk);
            fmc_data_int <= 16'bZ;
            nwe <= 1'b1;

            @(negedge clk);
            cle <= 1'b0;

            //Wait for read
            @(negedge clk);
            @(negedge clk);
            
            //read
            noe <= 1'b0;
            @(posedge clk);
            noe <= 1'b1;
            @(negedge clk);

            @(negedge clk); nce <= 1'b1;

        end
    endtask

    //Generate a clock
    initial begin
        clk <= 1'b0;
        forever begin
            #5;
            clk <= ~clk;
        end
    end

    initial begin
        $dumpfile("fmc.vcd");
        $dumpvars;
        ale <= 1'b0;
        cle <= 1'b0;
        nce <= 1'b1;
        noe <= 1'b1;
        nwe <= 1'b1;
        fmc_data_int <= 16'bZ;
        #20;
        fmc_read(16'hABCD);

    end

endmodule