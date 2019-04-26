vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/dist_mem_gen_v8_0_12
vlib modelsim_lib/msim/xil_defaultlib

vmap dist_mem_gen_v8_0_12 modelsim_lib/msim/dist_mem_gen_v8_0_12
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work dist_mem_gen_v8_0_12 -64 -incr \
"../../../7 minimipsb3/minimips/minimips.ip_user_files/ipstatic/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/ip/inst_rom/sim/inst_rom.v" \


vlog -work xil_defaultlib \
"glbl.v"

