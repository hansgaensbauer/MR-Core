connect_debug_port u_ila_0/probe0 [get_nets [list {pulsegen/regfile[8]_8[0]} {pulsegen/regfile[8]_8[1]} {pulsegen/regfile[8]_8[2]} {pulsegen/regfile[8]_8[3]} {pulsegen/regfile[8]_8[4]} {pulsegen/regfile[8]_8[5]} {pulsegen/regfile[8]_8[6]} {pulsegen/regfile[8]_8[7]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {pulsegen/regfile[5]_1[0]} {pulsegen/regfile[5]_1[1]} {pulsegen/regfile[5]_1[2]} {pulsegen/regfile[5]_1[3]} {pulsegen/regfile[5]_1[4]} {pulsegen/regfile[5]_1[5]} {pulsegen/regfile[5]_1[6]} {pulsegen/regfile[5]_1[7]}]]
connect_debug_port u_ila_0/probe2 [get_nets [list {pulsegen/regfile[6]_6[0]} {pulsegen/regfile[6]_6[1]} {pulsegen/regfile[6]_6[2]} {pulsegen/regfile[6]_6[3]} {pulsegen/regfile[6]_6[4]} {pulsegen/regfile[6]_6[5]} {pulsegen/regfile[6]_6[6]} {pulsegen/regfile[6]_6[7]}]]
connect_debug_port u_ila_0/probe3 [get_nets [list {pulsegen/regfile[7]_7[0]} {pulsegen/regfile[7]_7[1]} {pulsegen/regfile[7]_7[2]} {pulsegen/regfile[7]_7[3]} {pulsegen/regfile[7]_7[4]} {pulsegen/regfile[7]_7[5]} {pulsegen/regfile[7]_7[6]} {pulsegen/regfile[7]_7[7]}]]
connect_debug_port u_ila_0/probe4 [get_nets [list {pulsegen/regfile[0]_3[0]} {pulsegen/regfile[0]_3[1]} {pulsegen/regfile[0]_3[2]} {pulsegen/regfile[0]_3[3]} {pulsegen/regfile[0]_3[4]} {pulsegen/regfile[0]_3[5]} {pulsegen/regfile[0]_3[6]} {pulsegen/regfile[0]_3[7]}]]
connect_debug_port u_ila_0/probe5 [get_nets [list {pulsegen/regfile[4]_0[0]} {pulsegen/regfile[4]_0[1]} {pulsegen/regfile[4]_0[2]} {pulsegen/regfile[4]_0[3]} {pulsegen/regfile[4]_0[4]} {pulsegen/regfile[4]_0[5]} {pulsegen/regfile[4]_0[6]} {pulsegen/regfile[4]_0[7]}]]
connect_debug_port u_ila_0/probe6 [get_nets [list {pulsegen/regfile[9]_9[0]} {pulsegen/regfile[9]_9[1]} {pulsegen/regfile[9]_9[2]} {pulsegen/regfile[9]_9[3]} {pulsegen/regfile[9]_9[4]} {pulsegen/regfile[9]_9[5]} {pulsegen/regfile[9]_9[6]} {pulsegen/regfile[9]_9[7]}]]
connect_debug_port u_ila_0/probe7 [get_nets [list {pulsegen/regfile[3]_2[0]} {pulsegen/regfile[3]_2[1]} {pulsegen/regfile[3]_2[2]} {pulsegen/regfile[3]_2[3]} {pulsegen/regfile[3]_2[4]} {pulsegen/regfile[3]_2[5]} {pulsegen/regfile[3]_2[6]} {pulsegen/regfile[3]_2[7]}]]
connect_debug_port u_ila_0/probe8 [get_nets [list {pulsegen/regfile[1]_4[0]} {pulsegen/regfile[1]_4[1]} {pulsegen/regfile[1]_4[2]} {pulsegen/regfile[1]_4[3]} {pulsegen/regfile[1]_4[4]} {pulsegen/regfile[1]_4[5]} {pulsegen/regfile[1]_4[6]} {pulsegen/regfile[1]_4[7]}]]
connect_debug_port u_ila_0/probe9 [get_nets [list {pulsegen/regfile[2]_5[0]} {pulsegen/regfile[2]_5[1]} {pulsegen/regfile[2]_5[2]} {pulsegen/regfile[2]_5[3]} {pulsegen/regfile[2]_5[4]} {pulsegen/regfile[2]_5[5]} {pulsegen/regfile[2]_5[6]} {pulsegen/regfile[2]_5[7]}]]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {pulsegen/address[0]} {pulsegen/address[1]} {pulsegen/address[2]} {pulsegen/address[3]} {pulsegen/address[4]} {pulsegen/address[5]} {pulsegen/address[6]} {pulsegen/address[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {pulsegen/data[0]} {pulsegen/data[1]} {pulsegen/data[2]} {pulsegen/data[3]} {pulsegen/data[4]} {pulsegen/data[5]} {pulsegen/data[6]} {pulsegen/data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {pulsegen/regfile[4]_1[0]} {pulsegen/regfile[4]_1[1]} {pulsegen/regfile[4]_1[2]} {pulsegen/regfile[4]_1[3]} {pulsegen/regfile[4]_1[4]} {pulsegen/regfile[4]_1[5]} {pulsegen/regfile[4]_1[6]} {pulsegen/regfile[4]_1[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {pulsegen/regfile[0]_4[0]} {pulsegen/regfile[0]_4[1]} {pulsegen/regfile[0]_4[2]} {pulsegen/regfile[0]_4[3]} {pulsegen/regfile[0]_4[4]} {pulsegen/regfile[0]_4[5]} {pulsegen/regfile[0]_4[6]} {pulsegen/regfile[0]_4[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {pulsegen/regfile[6]_7[0]} {pulsegen/regfile[6]_7[1]} {pulsegen/regfile[6]_7[2]} {pulsegen/regfile[6]_7[3]} {pulsegen/regfile[6]_7[4]} {pulsegen/regfile[6]_7[5]} {pulsegen/regfile[6]_7[6]} {pulsegen/regfile[6]_7[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {pulsegen/regfile[7]_8[0]} {pulsegen/regfile[7]_8[1]} {pulsegen/regfile[7]_8[2]} {pulsegen/regfile[7]_8[3]} {pulsegen/regfile[7]_8[4]} {pulsegen/regfile[7]_8[5]} {pulsegen/regfile[7]_8[6]} {pulsegen/regfile[7]_8[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {pulsegen/regfile[9]_10[0]} {pulsegen/regfile[9]_10[1]} {pulsegen/regfile[9]_10[2]} {pulsegen/regfile[9]_10[3]} {pulsegen/regfile[9]_10[4]} {pulsegen/regfile[9]_10[5]} {pulsegen/regfile[9]_10[6]} {pulsegen/regfile[9]_10[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 8 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {pulsegen/regfile[8]_9[0]} {pulsegen/regfile[8]_9[1]} {pulsegen/regfile[8]_9[2]} {pulsegen/regfile[8]_9[3]} {pulsegen/regfile[8]_9[4]} {pulsegen/regfile[8]_9[5]} {pulsegen/regfile[8]_9[6]} {pulsegen/regfile[8]_9[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {pulsegen/regfile[3]_3[0]} {pulsegen/regfile[3]_3[1]} {pulsegen/regfile[3]_3[2]} {pulsegen/regfile[3]_3[3]} {pulsegen/regfile[3]_3[4]} {pulsegen/regfile[3]_3[5]} {pulsegen/regfile[3]_3[6]} {pulsegen/regfile[3]_3[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {pulsegen/regfile[1]_5[0]} {pulsegen/regfile[1]_5[1]} {pulsegen/regfile[1]_5[2]} {pulsegen/regfile[1]_5[3]} {pulsegen/regfile[1]_5[4]} {pulsegen/regfile[1]_5[5]} {pulsegen/regfile[1]_5[6]} {pulsegen/regfile[1]_5[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {pulsegen/regfile[2]_6[0]} {pulsegen/regfile[2]_6[1]} {pulsegen/regfile[2]_6[2]} {pulsegen/regfile[2]_6[3]} {pulsegen/regfile[2]_6[4]} {pulsegen/regfile[2]_6[5]} {pulsegen/regfile[2]_6[6]} {pulsegen/regfile[2]_6[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {pulsegen/regfile[5]_2[0]} {pulsegen/regfile[5]_2[1]} {pulsegen/regfile[5]_2[2]} {pulsegen/regfile[5]_2[3]} {pulsegen/regfile[5]_2[4]} {pulsegen/regfile[5]_2[5]} {pulsegen/regfile[5]_2[6]} {pulsegen/regfile[5]_2[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list pulsegen/load_spi_data]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_BUFG]
