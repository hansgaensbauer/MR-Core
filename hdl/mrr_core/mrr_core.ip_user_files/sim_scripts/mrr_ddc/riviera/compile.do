transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xbip_utils_v3_0_13
vlib riviera/axi_utils_v2_0_9
vlib riviera/xbip_pipe_v3_0_9
vlib riviera/xbip_bram18k_v3_0_9
vlib riviera/mult_gen_v12_0_21
vlib riviera/cmpy_v6_0_24
vlib riviera/xil_defaultlib
vlib riviera/xbip_dsp48_wrapper_v3_0_6
vlib riviera/xbip_dsp48_addsub_v3_0_9
vlib riviera/xbip_dsp48_multadd_v3_0_9
vlib riviera/dds_compiler_v6_0_25
vlib riviera/xlslice_v1_0_4
vlib riviera/cic_compiler_v4_0_19
vlib riviera/fir_compiler_v7_2_22

vmap xpm riviera/xpm
vmap xbip_utils_v3_0_13 riviera/xbip_utils_v3_0_13
vmap axi_utils_v2_0_9 riviera/axi_utils_v2_0_9
vmap xbip_pipe_v3_0_9 riviera/xbip_pipe_v3_0_9
vmap xbip_bram18k_v3_0_9 riviera/xbip_bram18k_v3_0_9
vmap mult_gen_v12_0_21 riviera/mult_gen_v12_0_21
vmap cmpy_v6_0_24 riviera/cmpy_v6_0_24
vmap xil_defaultlib riviera/xil_defaultlib
vmap xbip_dsp48_wrapper_v3_0_6 riviera/xbip_dsp48_wrapper_v3_0_6
vmap xbip_dsp48_addsub_v3_0_9 riviera/xbip_dsp48_addsub_v3_0_9
vmap xbip_dsp48_multadd_v3_0_9 riviera/xbip_dsp48_multadd_v3_0_9
vmap dds_compiler_v6_0_25 riviera/dds_compiler_v6_0_25
vmap xlslice_v1_0_4 riviera/xlslice_v1_0_4
vmap cic_compiler_v4_0_19 riviera/cic_compiler_v4_0_19
vmap fir_compiler_v7_2_22 riviera/fir_compiler_v7_2_22

vlog -work xpm  -incr -l xpm -l xbip_utils_v3_0_13 -l axi_utils_v2_0_9 -l xbip_pipe_v3_0_9 -l xbip_bram18k_v3_0_9 -l mult_gen_v12_0_21 -l cmpy_v6_0_24 -l xil_defaultlib -l xbip_dsp48_wrapper_v3_0_6 -l xbip_dsp48_addsub_v3_0_9 -l xbip_dsp48_multadd_v3_0_9 -l dds_compiler_v6_0_25 -l xlslice_v1_0_4 -l cic_compiler_v4_0_19 -l fir_compiler_v7_2_22 \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_13 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/24e7/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_9 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/1a81/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_9 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/713b/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_9 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/cd0f/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_21 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/f2b8/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work cmpy_v6_0_24 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/bb0d/hdl/cmpy_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/mrr_ddc/ip/mrr_ddc_cmpy_0_1/sim/mrr_ddc_cmpy_0_1.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_6 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/f596/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_9 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/378b/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_multadd_v3_0_9 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/fe6e/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \

vcom -work dds_compiler_v6_0_25 -2008  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/float_pkg.vhd" \

vcom -work dds_compiler_v6_0_25 -93  -incr \
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

vcom -work dds_compiler_v6_0_25 -2008  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/5255/hdl/sin_cos_fp.vhd" \

vcom -work dds_compiler_v6_0_25 -93  -incr \
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

vcom -work xil_defaultlib -93  -incr \
"../../../bd/mrr_ddc/ip/mrr_ddc_dds_compiler_0_0/sim/mrr_ddc_dds_compiler_0_0.vhd" \

vlog -work xlslice_v1_0_4  -incr -v2k5 -l xpm -l xbip_utils_v3_0_13 -l axi_utils_v2_0_9 -l xbip_pipe_v3_0_9 -l xbip_bram18k_v3_0_9 -l mult_gen_v12_0_21 -l cmpy_v6_0_24 -l xil_defaultlib -l xbip_dsp48_wrapper_v3_0_6 -l xbip_dsp48_addsub_v3_0_9 -l xbip_dsp48_multadd_v3_0_9 -l dds_compiler_v6_0_25 -l xlslice_v1_0_4 -l cic_compiler_v4_0_19 -l fir_compiler_v7_2_22 \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/a97c/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 -l xpm -l xbip_utils_v3_0_13 -l axi_utils_v2_0_9 -l xbip_pipe_v3_0_9 -l xbip_bram18k_v3_0_9 -l mult_gen_v12_0_21 -l cmpy_v6_0_24 -l xil_defaultlib -l xbip_dsp48_wrapper_v3_0_6 -l xbip_dsp48_addsub_v3_0_9 -l xbip_dsp48_multadd_v3_0_9 -l dds_compiler_v6_0_25 -l xlslice_v1_0_4 -l cic_compiler_v4_0_19 -l fir_compiler_v7_2_22 \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_0_1/sim/mrr_ddc_xlslice_0_1.v" \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_0_2/sim/mrr_ddc_xlslice_0_2.v" \

vcom -work cic_compiler_v4_0_19 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/9f7e/hdl/cic_compiler_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/mrr_ddc/ip/mrr_ddc_CIC_0/sim/mrr_ddc_CIC_0.vhd" \

vcom -work fir_compiler_v7_2_22 -93  -incr \
"../../../../mrr_core.gen/sources_1/bd/mrr_ddc/ipshared/b54e/hdl/fir_compiler_v7_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/mrr_ddc/ip/mrr_ddc_HalfBand_0/sim/mrr_ddc_HalfBand_0.vhd" \
"../../../bd/mrr_ddc/ip/mrr_ddc_Final_FIR_0/sim/mrr_ddc_Final_FIR_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 -l xpm -l xbip_utils_v3_0_13 -l axi_utils_v2_0_9 -l xbip_pipe_v3_0_9 -l xbip_bram18k_v3_0_9 -l mult_gen_v12_0_21 -l cmpy_v6_0_24 -l xil_defaultlib -l xbip_dsp48_wrapper_v3_0_6 -l xbip_dsp48_addsub_v3_0_9 -l xbip_dsp48_multadd_v3_0_9 -l dds_compiler_v6_0_25 -l xlslice_v1_0_4 -l cic_compiler_v4_0_19 -l fir_compiler_v7_2_22 \
"../../../bd/mrr_ddc/sim/mrr_ddc.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/mrr_ddc/ip/mrr_ddc_fir_compiler_0_5/sim/mrr_ddc_fir_compiler_0_5.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 -l xpm -l xbip_utils_v3_0_13 -l axi_utils_v2_0_9 -l xbip_pipe_v3_0_9 -l xbip_bram18k_v3_0_9 -l mult_gen_v12_0_21 -l cmpy_v6_0_24 -l xil_defaultlib -l xbip_dsp48_wrapper_v3_0_6 -l xbip_dsp48_addsub_v3_0_9 -l xbip_dsp48_multadd_v3_0_9 -l dds_compiler_v6_0_25 -l xlslice_v1_0_4 -l cic_compiler_v4_0_19 -l fir_compiler_v7_2_22 \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_0_5/sim/mrr_ddc_xlslice_0_5.v" \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_1_4/sim/mrr_ddc_xlslice_1_4.v" \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_2_2/sim/mrr_ddc_xlslice_2_2.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/mrr_ddc/ip/mrr_ddc_CIC_4/sim/mrr_ddc_CIC_4.vhd" \
"../../../bd/mrr_ddc/ip/mrr_ddc_HalfBand_4/sim/mrr_ddc_HalfBand_4.vhd" \
"../../../bd/mrr_ddc/ip/mrr_ddc_Final_FIR_4/sim/mrr_ddc_Final_FIR_4.vhd" \
"../../../bd/mrr_ddc/ip/mrr_ddc_droop_comp_4/sim/mrr_ddc_droop_comp_4.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 -l xpm -l xbip_utils_v3_0_13 -l axi_utils_v2_0_9 -l xbip_pipe_v3_0_9 -l xbip_bram18k_v3_0_9 -l mult_gen_v12_0_21 -l cmpy_v6_0_24 -l xil_defaultlib -l xbip_dsp48_wrapper_v3_0_6 -l xbip_dsp48_addsub_v3_0_9 -l xbip_dsp48_multadd_v3_0_9 -l dds_compiler_v6_0_25 -l xlslice_v1_0_4 -l cic_compiler_v4_0_19 -l fir_compiler_v7_2_22 \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_0_6/sim/mrr_ddc_xlslice_0_6.v" \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_1_5/sim/mrr_ddc_xlslice_1_5.v" \
"../../../bd/mrr_ddc/ip/mrr_ddc_xlslice_2_3/sim/mrr_ddc_xlslice_2_3.v" \

vlog -work xil_defaultlib \
"glbl.v"

