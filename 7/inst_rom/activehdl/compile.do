vlib work
vlib activehdl

vlib activehdl/dist_mem_gen_v8_0_12
vlib activehdl/xil_defaultlib

vmap dist_mem_gen_v8_0_12 activehdl/dist_mem_gen_v8_0_12
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work dist_mem_gen_v8_0_12  -v2k5 \
"../../../7 minimipsb3/minimips/minimips.ip_user_files/ipstatic/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/ip/inst_rom/sim/inst_rom.v" \


vlog -work xil_defaultlib \
"glbl.v"

