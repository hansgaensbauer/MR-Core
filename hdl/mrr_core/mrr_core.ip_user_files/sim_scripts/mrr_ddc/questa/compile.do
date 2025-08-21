vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xbip_utils_v3_0_13
vlib questa_lib/msim/axi_utils_v2_0_9
vlib questa_lib/msim/xbip_pipe_v3_0_9
vlib questa_lib/msim/xbip_bram18k_v3_0_9
vlib questa_lib/msim/mult_gen_v12_0_21
vlib questa_lib/msim/cmpy_v6_0_24
vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xbip_dsp48_wrapper_v3_0_6
vlib questa_lib/msim/xbip_dsp48_addsub_v3_0_9
vlib questa_lib/msim/xbip_dsp48_multadd_v3_0_9
vlib questa_lib/msim/dds_compiler_v6_0_25
vlib questa_lib/msim/xlslice_v1_0_4
vlib questa_lib/msim/cic_compiler_v4_0_19
vlib questa_lib/msim/fir_compiler_v7_2_22

vmap xpm questa_lib/msim/xpm
vmap xbip_utils_v3_0_13 questa_lib/msim/xbip_utils_v3_0_13
vmap axi_utils_v2_0_9 questa_lib/msim/axi_utils_v2_0_9
vmap xbip_pipe_v3_0_9 questa_lib/msim/xbip_pipe_v3_0_9
vmap xbip_bram18k_v3_0_9 questa_lib/msim/xbip_bram18k_v3_0_9
vmap mult_gen_v12_0_21 questa_lib/msim/mult_gen_v12_0_21
vmap cmpy_v6_0_24 questa_lib/msim/cmpy_v6_0_24
vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xbip_dsp48_wrapper_v3_0_6 questa_lib/msim/xbip_dsp48_wrapper_v3_0_6
vmap xbip_dsp48_addsub_v3_0_9 questa_lib/msim/xbip_dsp48_addsub_v3_0_9
vmap xbip_dsp48_multadd_v3_0_9 questa_lib/msim/xbip_dsp48_multadd_v3_0_9
vmap dds_compiler_v6_0_25 questa_lib/msim/dds_compiler_v6_0_25
vmap xlslice_v1_0_4 questa_lib/msim/xlslice_v1_0_4
vmap cic_compiler_v4_0_19 questa_lib/msim/cic_compiler_v4_0_19
vmap fir_compiler_v7_2_22 questa_lib/msim/fir_compiler_v7_2_22

vlog -work xpm  -incr -mfcu  -sv \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_13  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/24e7/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_9  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/1a81/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_9  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/713b/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_9  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/cd0f/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_21  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/f2b8/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work cmpy_v6_0_24  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/bb0d/hdl/cmpy_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/mrr_ddc/ip/mrr_ddc_cmpy_0_1/sim/mrr_ddc_cmpy_0_1.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/f596/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_9  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/378b/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_9  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/fe6e/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work dds_compiler_v6_0_25  -2008  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/float_pkg.vhd" \

vcom -work dds_compiler_v6_0_25  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dds_compiler_v6_0_viv_comp.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dds_compiler_v6_0_comp.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/pkg_dds_compiler_v6_0.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/pkg_beta.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/pkg_alpha.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dds_compiler_v6_0_hdl_comps.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dither_wrap.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/pipe_add.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/lut_ram.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/lut5_ram.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/sin_cos.vhd" \

vcom -work dds_compiler_v6_0_25  -2008  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/sin_cos_fp.vhd" \

vcom -work dds_compiler_v6_0_25  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/sin_cos_quad_rast.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dsp48_wrap.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/accum.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/raster_accum.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dds_compiler_v6_0_eff_lut.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dds_compiler_v6_0_eff.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dds_compiler_v6_0_rdy.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dds_compiler_v6_0_core.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dds_compiler_v6_0_viv.vhd" \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/dds_compiler_v6_0.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/mrr_ddc/ip/mrr_ddc_dds_compiler_0_0/sim/mrr_ddc_dds_compiler_0_0.vhd" \

vlog -work xlslice_v1_0_4  -incr -mfcu  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/a97c/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_0_1/sim/mrr_ddc_xlslice_0_1.v" \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_0_2/sim/mrr_ddc_xlslice_0_2.v" \

vcom -work cic_compiler_v4_0_19  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/9f7e/hdl/cic_compiler_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/mrr_ddc/ip/mrr_ddc_CIC_0/sim/mrr_ddc_CIC_0.vhd" \

vcom -work fir_compiler_v7_2_22  -93  \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/b54e/hdl/fir_compiler_v7_2_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../bd/mrr_ddc/ip/mrr_ddc_HalfBand_0/sim/mrr_ddc_HalfBand_0.vhd" \
"../../../bd/mrr_ddc/ip/mrr_ddc_Final_FIR_0/sim/mrr_ddc_Final_FIR_0.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../bd/mrr_ddc/sim/mrr_ddc.v" \

vcom -work xil_defaultlib  -93  \
"../../../bd/mrr_ddc/ip/mrr_ddc_fir_compiler_0_5/sim/mrr_ddc_fir_compiler_0_5.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_0_5/sim/mrr_ddc_xlslice_0_5.v" \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_1_4/sim/mrr_ddc_xlslice_1_4.v" \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_2_2/sim/mrr_ddc_xlslice_2_2.v" \

vcom -work xil_defaultlib  -93  \
"../../../bd/mrr_ddc/ip/mrr_ddc_CIC_4/sim/mrr_ddc_CIC_4.vhd" \
"../../../bd/mrr_ddc/ip/mrr_ddc_HalfBand_4/sim/mrr_ddc_HalfBand_4.vhd" \
"../../../bd/mrr_ddc/ip/mrr_ddc_Final_FIR_4/sim/mrr_ddc_Final_FIR_4.vhd" \
"../../../bd/mrr_ddc/ip/mrr_ddc_droop_comp_4/sim/mrr_ddc_droop_comp_4.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_0_6/sim/mrr_ddc_xlslice_0_6.v" \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_1_5/sim/mrr_ddc_xlslice_1_5.v" \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_2_3/sim/mrr_ddc_xlslice_2_3.v" \

vlog -work xil_defaultlib \
"glbl.v"

