`timescale 1ns / 1ps

module mrc_sequencer(
	input clk_i,
    
    //SPI Input from STM32
    input sck_i,
    input sdi_i,
    input ncs_i,
    
    output logic sys_rst,
    output logic sequence_active,
	output logic sw_o,
	output logic [15:0] amp,
	output logic [23:0] ftw,
	output logic [15:0] phase,
	output logic [1:0] grinx,
    output logic [1:0] griny,
    output logic [1:0] grinz,
    
    //For physical debug only!
    output logic prog,
    output logic seq,
    output logic spiload
	);
	
	import mrc_sequencer_pkg::*;       //data package with all the parameters and structs
	
	localparam DEAD_TIME = 2;
	
	system_state state;
	logic [7:0] ctrl_reg;
	logic [15:0] instruction;
	logic [15:0] last_instruction;
	
	//Phase Memory
	logic [$clog2(PHASE_DEPTH)-1:0] phase_sel;
	wire [15:0] phase_mux_out;
	logic phase_mux_cs, phase_mux_we, phase_mux_oe;
	bram16 #(PHASE_DEPTH) phase_mux (
        .clk(clk_i),
        .addr(phase_sel),
        .data(phase_mux_out),
        .cs(phase_mux_cs),
        .we(phase_mux_we), 
        .oe(phase_mux_oe)
    );
    
    //AMP Memory
	logic [$clog2(AMP_DEPTH)-1:0] amp_sel;
	wire [15:0] amp_mux_out;
	logic amp_mux_cs, amp_mux_we, amp_mux_oe;
	bram16 #(AMP_DEPTH) amp_mux (
        .clk(clk_i),
        .addr(amp_sel),
        .data(amp_mux_out),
        .cs(amp_mux_cs),
        .we(amp_mux_we), 
        .oe(amp_mux_oe)
    );
    
    //Program Memory
	logic [$clog2(PROG_DEPTH)-1:0] prog_rom_addr;
	wire [15:0] prog_rom_out;
	logic prog_rom_cs, prog_rom_we, prog_rom_oe;
	bram16 #(PROG_DEPTH) prog_rom (
        .clk(clk_i),
        .addr(prog_rom_addr),
        .data(prog_rom_out),
        .cs(prog_rom_cs),
        .we(prog_rom_we), 
        .oe(prog_rom_oe)
    );
    
    logic load_spi_data;
    logic [15:0] spi_data_o;
	spi_driver stm32_spi (
	   .clk_i(clk_i),
	   .rst_i(sys_rst),
	   .sck_i(sck_i),
	   .sdi_i(sdi_i),
	   .ncs_i(ncs_i),
	   .trig_o(load_spi_data),
	   .data_o(spi_data_o)
	);
	
	//find ncs edges to preserve sensitivity list
    logic last_ncs, ncs_negedge, ncs_posedge;
    always_ff @(posedge clk_i) begin
        last_ncs <= ncs_i;
    end
    assign ncs_negedge = last_ncs & ~ncs_i;
    assign ncs_posedge = ~last_ncs & ncs_i;
    
    logic [$clog2(PROG_DEPTH + AMP_DEPTH + PHASE_DEPTH)-1:0] prog_sequence_counter;
	logic [$clog2(PROG_DEPTH + AMP_DEPTH + PHASE_DEPTH)-1:0] prog_sequence_top;
	logic [$clog2(PROG_DEPTH)-1:0] instruction_counter;
	logic [$clog2(PROG_DEPTH)-1:0] next_instruction_counter;

	//Address multiplexing
	always_comb begin
		case(state)
			STATE_IDLE: begin 
				phase_sel = 0;
				amp_sel = 0;
				prog_rom_addr = 0;

				phase_mux_cs = 1'b0;
				amp_mux_cs = 1'b0;
				prog_rom_cs = ctrl_reg[TRIGGER_BIT];

				amp_mux_oe = 1'b0;
				phase_mux_oe = 1'b0;
				prog_rom_oe = 1'b0;

				phase_mux_we = 1'b0;
				amp_mux_we = 1'b0;
				prog_rom_we = 1'b0;
			end
			STATE_PROG_ACTIVE: begin
				phase_sel = prog_sequence_counter;
				amp_sel = prog_sequence_counter - PHASE_DEPTH;
				prog_rom_addr = prog_sequence_counter - PHASE_DEPTH - AMP_DEPTH;

				phase_mux_cs = prog_sequence_counter < PHASE_DEPTH;
				amp_mux_cs = prog_sequence_counter < PHASE_DEPTH + AMP_DEPTH && prog_sequence_counter >= PHASE_DEPTH;
				prog_rom_cs = prog_sequence_counter >= PHASE_DEPTH + AMP_DEPTH;

				phase_mux_oe = 1'b0;
				amp_mux_oe = 1'b0;
				prog_rom_oe = 1'b0;

				phase_mux_we = load_spi_data;
				amp_mux_we = load_spi_data;
				prog_rom_we = load_spi_data;
			end
			STATE_SEQ_ACTIVE: begin
				phase_sel = get_phase_sel(instruction);
				amp_sel = get_amp_sel(instruction);
				prog_rom_addr = next_instruction_counter;

				phase_mux_cs = 1'b1;
				amp_mux_cs = 1'b1;
				prog_rom_cs = 1'b1;

				amp_mux_oe = 1'b1;
				phase_mux_oe = 1'b1;
				prog_rom_oe = 1'b1;

				phase_mux_we = 1'b0;
				amp_mux_we = 1'b0;
				prog_rom_we = 1'b0;
			end
		endcase
	end
    
    assign phase_mux_out = (state == STATE_PROG_ACTIVE) ? spi_data_o : 16'bZ;
    assign amp_mux_out = (state == STATE_PROG_ACTIVE) ? spi_data_o : 16'bZ;
    assign prog_rom_out = (state == STATE_PROG_ACTIVE) ? spi_data_o : 16'bZ;
    assign instruction = prog_rom_out;
    
	//State transitions
    always_ff @(posedge clk_i) begin
        if(sys_rst) begin
            ctrl_reg <= 8'b0;
            state <= STATE_IDLE;
            prog_sequence_counter <= 0;
            prog_sequence_top <= 0;
            ftw <= 15'b0;
        end else begin
            case(state)
                STATE_IDLE: begin
                    if(load_spi_data) begin
                        if(spi_data_o[SPI_CMD_TYPE_BIT] == 1'b1) begin //This is a control register program command
                            if(spi_data_o[SPI_CMD_FTW_BIT])state <= STATE_SET_FREQ_1;
                            else ctrl_reg <= spi_data_o[7:0];
                        end else begin //This is a "start sequence programming" command
                            prog_sequence_top <= spi_data_o[$clog2(PROG_DEPTH)-1:0];
                            state <= STATE_PROG_ACTIVE;
                        end
                    end else begin
                        prog_sequence_counter <= 0;
                        prog_sequence_top <= 0;
                        if (ctrl_reg[TRIGGER_BIT]) begin
                            state <= STATE_SEQ_ACTIVE;
                            ctrl_reg <= ctrl_reg & ~(1<<TRIGGER_BIT);
                        end
                    end
                end
                STATE_PROG_ACTIVE: begin
                    if(load_spi_data) prog_sequence_counter <= prog_sequence_counter + 1'b1;
                    if(prog_sequence_counter == prog_sequence_top || ncs_posedge) state <= STATE_IDLE;
                end
                STATE_SEQ_ACTIVE: begin
                    if(optype(instruction) == HALT_OP || ncs_negedge || instruction_counter == PROG_DEPTH) begin
                        state <= STATE_IDLE;
                    end
                end
                STATE_SET_FREQ_1: begin
                    if(load_spi_data) begin
                        ftw[23:16] <= spi_data_o[7:0];
                        state <= STATE_SET_FREQ_2;
                    end else state <= STATE_SET_FREQ_1;
                end
                STATE_SET_FREQ_2: begin
                    if(load_spi_data) begin
                        ftw[15:0] <= spi_data_o;
                        state <= STATE_IDLE;
                    end else state <= STATE_SET_FREQ_2;
                end
            endcase
        end
    end
	
	logic [15:0] loop_counters [0:3];
	
	//pipelined instruction components
	logic command_type;
    
    logic loop_complete; //Check if the appropriate loop counter is zero
    assign loop_complete = (loop_counters[get_counter(instruction)] == 0);
    
	//find the next instruction address
	always_comb begin
	   case(optype(instruction))
	       CMD_OP: next_instruction_counter = instruction_counter + 1'b1;
           LOOPSET_OP: next_instruction_counter = instruction_counter + 1'b1;
           JUMP_OP: next_instruction_counter = loop_complete ? instruction_counter + 1'b1 : get_immediate(instruction);
		   HALT_OP: next_instruction_counter = 0;
           default: next_instruction_counter = 0;
        endcase	
	end
	
	//Update the next instruction counter
	always_ff @(posedge clk_i) begin
	   if(sys_rst) begin
	       last_instruction <= 0;
	       instruction_counter <= 0;
	       loop_counters[0] <= 0;
	       loop_counters[1] <= 0;
	       loop_counters[2] <= 0;
	       loop_counters[3] <= 0;
           grinx <= 0;
           griny <= 0;
           grinz <= 0;
           amp <= 0;
           phase <= 0;
	   end else begin
           last_instruction <= instruction;
            if(state == STATE_SEQ_ACTIVE) begin
                instruction_counter <= next_instruction_counter;
                case(optype(instruction))
                    CMD_OP: begin
                    end
                    LOOPSET_OP: begin
                        loop_counters[get_counter(instruction)] <= get_immediate(instruction);
                    end
                    JUMP_OP: begin
                        loop_counters[get_counter(instruction)] <= loop_counters[get_counter(instruction)] - 1'b1;
                    end
                endcase
                if(optype(last_instruction) == CMD_OP) begin
                    grinx <= get_grinx(last_instruction);
                    griny <= get_griny(last_instruction);
                    grinz <= get_grinz(last_instruction);
                    amp <= amp_mux_out;
                    phase <= phase_mux_out;
                end else begin
                  amp <= amp;
                  phase <= phase;
                end
            end else begin
                phase <= 0;
                amp <= 0;
                grinx <= 0;
                griny <= 0;
                grinz <= 0;
                instruction_counter <= 0;
            end
		end
	end
	
	assign sequence_active = (state == STATE_SEQ_ACTIVE);
	assign sys_rst = ctrl_reg[RESET_BIT];
	
	//Switch dead time enforcement
	logic [$clog2(DEAD_TIME*120)-1:0] dead_time_counter;
	logic last_cycle_tx;
	always_ff @(posedge clk_i) begin
	   last_cycle_tx <= (amp != 0);
	   if(sys_rst) begin
	       dead_time_counter <= 0;
	   end else begin
	       if(amp != 0) begin
	           sw_o <= 1'b1;
	       end else if(last_cycle_tx) begin
	           dead_time_counter <= DEAD_TIME * 120;
	       end else if (dead_time_counter == 0) begin
	           sw_o <= 1'b0;
	       end else begin
	           sw_o <= sw_o;
	           dead_time_counter <= dead_time_counter - 1'b1;
	       end
	   end
	end
	
	assign prog = (state == STATE_PROG_ACTIVE);
	assign seq = (state == STATE_SEQ_ACTIVE);
	assign spiload = load_spi_data;
	

endmodule