onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xpm -L xbip_utils_v3_0_13 -L axi_utils_v2_0_9 -L xbip_pipe_v3_0_9 -L xbip_bram18k_v3_0_9 -L mult_gen_v12_0_21 -L cmpy_v6_0_24 -L xil_defaultlib -L xbip_dsp48_wrapper_v3_0_6 -L xbip_dsp48_addsub_v3_0_9 -L xbip_dsp48_multadd_v3_0_9 -L dds_compiler_v6_0_25 -L xlslice_v1_0_4 -L cic_compiler_v4_0_19 -L fir_compiler_v7_2_22 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.mrr_ddc xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {mrr_ddc.udo}

run 1000ns

quit -force
