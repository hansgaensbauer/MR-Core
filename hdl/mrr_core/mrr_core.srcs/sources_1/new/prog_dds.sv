`timescale 1ns / 1ps

module prog_dds(
    input CLK,
    input RST,
    input logic [23:0] freq,
    input logic [15:0] phase,
    input logic [15:0] amplitude,
    output logic [15:0] dds_output
    );
    
    logic [15:0] phasegen_output_phase;
    logic [15:0] output_unscaled;
    
    prog_phasegen prog_phasegen_0
    (
        .RST(RST),
        .CLK(CLK),
        .freq(freq),
        .phase(phasegen_output_phase)
    );
    
    dds_compiler_0 sin_cos_lut_0(
        .aclk(CLK),
        .s_axis_phase_tvalid(1'b1),
        .s_axis_phase_tdata(phasegen_output_phase + phase),
        .m_axis_data_tvalid(),
        .m_axis_data_tdata(output_unscaled)
    );
    
    mult_gen_0 mult_gen_ip_0(
        .CLK(CLK),
        .A(output_unscaled),
        .B(amplitude),
        .P(dds_output)
    );
    
endmodule
