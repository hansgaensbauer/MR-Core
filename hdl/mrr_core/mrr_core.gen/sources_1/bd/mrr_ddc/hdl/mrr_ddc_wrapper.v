//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Sun Aug 25 14:17:28 2024
//Host        : hanlabMR running 64-bit major release  (build 9200)
//Command     : generate_target mrr_ddc_wrapper.bd
//Design      : mrr_ddc_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mrr_ddc_wrapper
   (CLK,
    I_AXIS_TDATA,
    I_AXIS_TVALID,
    O_AXIS_TDATA_IMAG,
    O_AXIS_TDATA_REAL,
    O_AXIS_TVALID,
    S_AXIS_PHASE_TDATA,
    S_AXIS_PHASE_TVALID);
  input CLK;
  input [31:0]I_AXIS_TDATA;
  input I_AXIS_TVALID;
  output [15:0]O_AXIS_TDATA_IMAG;
  output [15:0]O_AXIS_TDATA_REAL;
  output O_AXIS_TVALID;
  input [15:0]S_AXIS_PHASE_TDATA;
  input S_AXIS_PHASE_TVALID;

  wire CLK;
  wire [31:0]I_AXIS_TDATA;
  wire I_AXIS_TVALID;
  wire [15:0]O_AXIS_TDATA_IMAG;
  wire [15:0]O_AXIS_TDATA_REAL;
  wire O_AXIS_TVALID;
  wire [15:0]S_AXIS_PHASE_TDATA;
  wire S_AXIS_PHASE_TVALID;

  mrr_ddc mrr_ddc_i
       (.CLK(CLK),
        .I_AXIS_TDATA(I_AXIS_TDATA),
        .I_AXIS_TVALID(I_AXIS_TVALID),
        .O_AXIS_TDATA_IMAG(O_AXIS_TDATA_IMAG),
        .O_AXIS_TDATA_REAL(O_AXIS_TDATA_REAL),
        .O_AXIS_TVALID(O_AXIS_TVALID),
        .S_AXIS_PHASE_TDATA(S_AXIS_PHASE_TDATA),
        .S_AXIS_PHASE_TVALID(S_AXIS_PHASE_TVALID));
endmodule
