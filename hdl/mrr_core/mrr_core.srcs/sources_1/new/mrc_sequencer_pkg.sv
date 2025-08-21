`timescale 1ns / 1ps

package mrc_sequencer_pkg;

    localparam PHASE_DEPTH = 4;
    localparam AMP_DEPTH = 4;
    localparam PROG_DEPTH = 512;
    
    localparam TRIGGER_BIT = 1;
    localparam RESET_BIT = 7;
    localparam SPI_CMD_TYPE_BIT = 15;
    localparam SPI_CMD_FTW_BIT = 14;

    typedef enum logic [1:0] {
        CMD_OP = 2'b00,
        LOOPSET_OP = 2'b01,
        JUMP_OP = 2'b10,
        HALT_OP = 2'b11
    } op_type;
    
    typedef enum {
        STATE_IDLE,
        STATE_PROG_ACTIVE,
        STATE_SEQ_ACTIVE,
        STATE_SET_FREQ_1,
        STATE_SET_FREQ_2
    } system_state;
    
    function op_type optype (input logic [15:0] instruction); 
        case(instruction[15:14])
            2'b00: return CMD_OP;
            2'b01: return LOOPSET_OP;
            2'b10: return JUMP_OP;
            2'b11: return HALT_OP;
        endcase
    endfunction

    function logic [1:0] get_phase_sel (input logic [15:0] instruction); 
        return instruction[11:10];
    endfunction

    function logic [1:0] get_amp_sel (input logic [15:0] instruction); 
        return instruction[13:12];
    endfunction
    
    function logic [1:0] get_counter (input logic [15:0] instruction); 
        return instruction[13:12];
    endfunction
    
    function logic [11:0] get_immediate (input logic [15:0] instruction); 
        return instruction[11:0];
    endfunction


    function logic [$clog2(AMP_DEPTH)-1:0] get_grinx (input logic [15:0] instruction); 
        return instruction[9:8];
    endfunction

    function logic [$clog2(AMP_DEPTH)-1:0] get_griny (input logic [15:0] instruction); 
        return instruction[7:6];
    endfunction

    function logic [$clog2(AMP_DEPTH)-1:0] get_grinz (input logic [15:0] instruction); 
        return instruction[5:4];
    endfunction

    
endpackage