//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
//Date        : Sun Aug 25 14:17:28 2024
//Host        : hanlabMR running 64-bit major release  (build 9200)
//Command     : generate_target mrr_ddc.bd
//Design      : mrr_ddc
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module filter_bank1_imp_555IQ7
   (CLK,
    M_AXIS_DATA_TDATA,
    M_AXIS_DATA_TVALID,
    S_AXIS_DATA_TDATA,
    S_AXIS_DATA_TREADY,
    S_AXIS_DATA_TVALID);
  input CLK;
  output [15:0]M_AXIS_DATA_TDATA;
  output M_AXIS_DATA_TVALID;
  input [15:0]S_AXIS_DATA_TDATA;
  output S_AXIS_DATA_TREADY;
  input S_AXIS_DATA_TVALID;

  wire [23:0]CIC_m_axis_data_tdata;
  wire CIC_m_axis_data_tvalid;
  wire CIC_s_axis_data_tready;
  wire CLK_1;
  wire [23:0]Final_FIR_m_axis_data_tdata;
  wire Final_FIR_m_axis_data_tvalid;
  wire [23:0]HalfBand_m_axis_data_tdata;
  wire HalfBand_m_axis_data_tvalid;
  wire [15:0]S_AXIS_DATA_TDATA_1;
  wire S_AXIS_DATA_TVALID_1;
  wire [23:0]droop_comp_m_axis_data_tdata;
  wire droop_comp_m_axis_data_tvalid;
  wire [15:0]xlslice_0_Dout;
  wire [15:0]xlslice_1_Dout;
  wire [15:0]xlslice_2_Dout;

  assign CLK_1 = CLK;
  assign M_AXIS_DATA_TDATA[15:0] = xlslice_2_Dout;
  assign M_AXIS_DATA_TVALID = Final_FIR_m_axis_data_tvalid;
  assign S_AXIS_DATA_TDATA_1 = S_AXIS_DATA_TDATA[15:0];
  assign S_AXIS_DATA_TREADY = CIC_s_axis_data_tready;
  assign S_AXIS_DATA_TVALID_1 = S_AXIS_DATA_TVALID;
  mrr_ddc_CIC_0 CIC
       (.aclk(CLK_1),
        .m_axis_data_tdata(CIC_m_axis_data_tdata),
        .m_axis_data_tvalid(CIC_m_axis_data_tvalid),
        .s_axis_data_tdata(S_AXIS_DATA_TDATA_1),
        .s_axis_data_tready(CIC_s_axis_data_tready),
        .s_axis_data_tvalid(S_AXIS_DATA_TVALID_1));
  mrr_ddc_Final_FIR_0 Final_FIR
       (.aclk(CLK_1),
        .m_axis_data_tdata(Final_FIR_m_axis_data_tdata),
        .m_axis_data_tvalid(Final_FIR_m_axis_data_tvalid),
        .s_axis_data_tdata(xlslice_1_Dout),
        .s_axis_data_tvalid(HalfBand_m_axis_data_tvalid));
  mrr_ddc_HalfBand_0 HalfBand
       (.aclk(CLK_1),
        .m_axis_data_tdata(HalfBand_m_axis_data_tdata),
        .m_axis_data_tvalid(HalfBand_m_axis_data_tvalid),
        .s_axis_data_tdata(droop_comp_m_axis_data_tdata),
        .s_axis_data_tvalid(droop_comp_m_axis_data_tvalid));
  mrr_ddc_fir_compiler_0_5 droop_comp
       (.aclk(CLK_1),
        .m_axis_data_tdata(droop_comp_m_axis_data_tdata),
        .m_axis_data_tvalid(droop_comp_m_axis_data_tvalid),
        .s_axis_data_tdata(xlslice_0_Dout),
        .s_axis_data_tvalid(CIC_m_axis_data_tvalid));
  mrr_ddc_xlslice_0_5 xlslice_0
       (.Din(CIC_m_axis_data_tdata),
        .Dout(xlslice_0_Dout));
  mrr_ddc_xlslice_1_4 xlslice_1
       (.Din(HalfBand_m_axis_data_tdata),
        .Dout(xlslice_1_Dout));
  mrr_ddc_xlslice_2_2 xlslice_2
       (.Din(Final_FIR_m_axis_data_tdata),
        .Dout(xlslice_2_Dout));
endmodule

module filter_bank2_imp_17AHFXO
   (CLK,
    M_AXIS_DATA_TDATA,
    M_AXIS_DATA_TVALID,
    S_AXIS_DATA_TDATA,
    S_AXIS_DATA_TREADY,
    S_AXIS_DATA_TVALID);
  input CLK;
  output [15:0]M_AXIS_DATA_TDATA;
  output M_AXIS_DATA_TVALID;
  input [15:0]S_AXIS_DATA_TDATA;
  output S_AXIS_DATA_TREADY;
  input S_AXIS_DATA_TVALID;

  wire [23:0]CIC_m_axis_data_tdata;
  wire CIC_m_axis_data_tvalid;
  wire CIC_s_axis_data_tready;
  wire CLK_1;
  wire [23:0]Final_FIR_m_axis_data_tdata;
  wire Final_FIR_m_axis_data_tvalid;
  wire [23:0]HalfBand_m_axis_data_tdata;
  wire HalfBand_m_axis_data_tvalid;
  wire [15:0]S_AXIS_DATA_TDATA_1;
  wire S_AXIS_DATA_TVALID_1;
  wire [23:0]droop_comp_m_axis_data_tdata;
  wire droop_comp_m_axis_data_tvalid;
  wire [15:0]xlslice_0_Dout;
  wire [15:0]xlslice_1_Dout;
  wire [15:0]xlslice_2_Dout;

  assign CLK_1 = CLK;
  assign M_AXIS_DATA_TDATA[15:0] = xlslice_2_Dout;
  assign M_AXIS_DATA_TVALID = Final_FIR_m_axis_data_tvalid;
  assign S_AXIS_DATA_TDATA_1 = S_AXIS_DATA_TDATA[15:0];
  assign S_AXIS_DATA_TREADY = CIC_s_axis_data_tready;
  assign S_AXIS_DATA_TVALID_1 = S_AXIS_DATA_TVALID;
  mrr_ddc_CIC_4 CIC
       (.aclk(CLK_1),
        .m_axis_data_tdata(CIC_m_axis_data_tdata),
        .m_axis_data_tvalid(CIC_m_axis_data_tvalid),
        .s_axis_data_tdata(S_AXIS_DATA_TDATA_1),
        .s_axis_data_tready(CIC_s_axis_data_tready),
        .s_axis_data_tvalid(S_AXIS_DATA_TVALID_1));
  mrr_ddc_Final_FIR_4 Final_FIR
       (.aclk(CLK_1),
        .m_axis_data_tdata(Final_FIR_m_axis_data_tdata),
        .m_axis_data_tvalid(Final_FIR_m_axis_data_tvalid),
        .s_axis_data_tdata(xlslice_1_Dout),
        .s_axis_data_tvalid(HalfBand_m_axis_data_tvalid));
  mrr_ddc_HalfBand_4 HalfBand
       (.aclk(CLK_1),
        .m_axis_data_tdata(HalfBand_m_axis_data_tdata),
        .m_axis_data_tvalid(HalfBand_m_axis_data_tvalid),
        .s_axis_data_tdata(droop_comp_m_axis_data_tdata),
        .s_axis_data_tvalid(droop_comp_m_axis_data_tvalid));
  mrr_ddc_droop_comp_4 droop_comp
       (.aclk(CLK_1),
        .m_axis_data_tdata(droop_comp_m_axis_data_tdata),
        .m_axis_data_tvalid(droop_comp_m_axis_data_tvalid),
        .s_axis_data_tdata(xlslice_0_Dout),
        .s_axis_data_tvalid(CIC_m_axis_data_tvalid));
  mrr_ddc_xlslice_0_6 xlslice_0
       (.Din(CIC_m_axis_data_tdata),
        .Dout(xlslice_0_Dout));
  mrr_ddc_xlslice_1_5 xlslice_1
       (.Din(HalfBand_m_axis_data_tdata),
        .Dout(xlslice_1_Dout));
  mrr_ddc_xlslice_2_3 xlslice_2
       (.Din(Final_FIR_m_axis_data_tdata),
        .Dout(xlslice_2_Dout));
endmodule

(* CORE_GENERATION_INFO = "mrr_ddc,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=mrr_ddc,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=20,numReposBlks=18,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=1,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "mrr_ddc.hwdef" *) 
module mrr_ddc
   (CLK,
    I_AXIS_TDATA,
    I_AXIS_TVALID,
    O_AXIS_TDATA_IMAG,
    O_AXIS_TDATA_REAL,
    O_AXIS_TVALID,
    S_AXIS_PHASE_TDATA,
    S_AXIS_PHASE_TVALID);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN mrr_ddc_CLK, FREQ_HZ 120000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input CLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.I_AXIS_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.I_AXIS_TDATA, LAYERED_METADATA undef" *) input [31:0]I_AXIS_TDATA;
  input I_AXIS_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.O_AXIS_TDATA_IMAG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.O_AXIS_TDATA_IMAG, LAYERED_METADATA undef" *) output [15:0]O_AXIS_TDATA_IMAG;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.O_AXIS_TDATA_REAL DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.O_AXIS_TDATA_REAL, LAYERED_METADATA undef" *) output [15:0]O_AXIS_TDATA_REAL;
  output O_AXIS_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.S_AXIS_PHASE_TDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.S_AXIS_PHASE_TDATA, LAYERED_METADATA undef" *) input [15:0]S_AXIS_PHASE_TDATA;
  input S_AXIS_PHASE_TVALID;

  wire CLK_1;
  wire [31:0]I_AXIS_TDATA_1;
  wire I_AXIS_TVALID_1;
  wire [15:0]S_AXIS_DATA_TDATA_1;
  wire [15:0]S_AXIS_PHASE_TDATA_1;
  wire S_AXIS_PHASE_TVALID_1;
  wire [47:0]cmpy_1_m_axis_dout_tdata;
  wire cmpy_1_m_axis_dout_tvalid;
  wire [31:0]dds_compiler_0_M_AXIS_DATA_TDATA;
  wire dds_compiler_0_M_AXIS_DATA_TVALID;
  wire [15:0]filter_bank1_M_AXIS_DATA_TDATA;
  wire [15:0]filter_bank2_M_AXIS_DATA_TDATA;
  wire filter_bank2_M_AXIS_DATA_TVALID;
  wire [15:0]xlslice_1_Dout;

  assign CLK_1 = CLK;
  assign I_AXIS_TDATA_1 = I_AXIS_TDATA[31:0];
  assign I_AXIS_TVALID_1 = I_AXIS_TVALID;
  assign O_AXIS_TDATA_IMAG[15:0] = filter_bank1_M_AXIS_DATA_TDATA;
  assign O_AXIS_TDATA_REAL[15:0] = filter_bank2_M_AXIS_DATA_TDATA;
  assign O_AXIS_TVALID = filter_bank2_M_AXIS_DATA_TVALID;
  assign S_AXIS_PHASE_TDATA_1 = S_AXIS_PHASE_TDATA[15:0];
  assign S_AXIS_PHASE_TVALID_1 = S_AXIS_PHASE_TVALID;
  mrr_ddc_cmpy_0_1 cmpy_1
       (.aclk(CLK_1),
        .m_axis_dout_tdata(cmpy_1_m_axis_dout_tdata),
        .m_axis_dout_tvalid(cmpy_1_m_axis_dout_tvalid),
        .s_axis_a_tdata(I_AXIS_TDATA_1),
        .s_axis_a_tvalid(I_AXIS_TVALID_1),
        .s_axis_b_tdata(dds_compiler_0_M_AXIS_DATA_TDATA),
        .s_axis_b_tvalid(dds_compiler_0_M_AXIS_DATA_TVALID));
  mrr_ddc_dds_compiler_0_0 dds_compiler_0
       (.aclk(CLK_1),
        .m_axis_data_tdata(dds_compiler_0_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(dds_compiler_0_M_AXIS_DATA_TVALID),
        .s_axis_phase_tdata(S_AXIS_PHASE_TDATA_1),
        .s_axis_phase_tvalid(S_AXIS_PHASE_TVALID_1));
  filter_bank1_imp_555IQ7 filter_bank1
       (.CLK(CLK_1),
        .M_AXIS_DATA_TDATA(filter_bank1_M_AXIS_DATA_TDATA),
        .S_AXIS_DATA_TDATA(S_AXIS_DATA_TDATA_1),
        .S_AXIS_DATA_TVALID(cmpy_1_m_axis_dout_tvalid));
  filter_bank2_imp_17AHFXO filter_bank2
       (.CLK(CLK_1),
        .M_AXIS_DATA_TDATA(filter_bank2_M_AXIS_DATA_TDATA),
        .M_AXIS_DATA_TVALID(filter_bank2_M_AXIS_DATA_TVALID),
        .S_AXIS_DATA_TDATA(xlslice_1_Dout),
        .S_AXIS_DATA_TVALID(cmpy_1_m_axis_dout_tvalid));
  mrr_ddc_xlslice_0_1 xlslice_1
       (.Din(cmpy_1_m_axis_dout_tdata),
        .Dout(xlslice_1_Dout));
  mrr_ddc_xlslice_0_2 xlslice_2
       (.Din(cmpy_1_m_axis_dout_tdata),
        .Dout(S_AXIS_DATA_TDATA_1));
endmodule
