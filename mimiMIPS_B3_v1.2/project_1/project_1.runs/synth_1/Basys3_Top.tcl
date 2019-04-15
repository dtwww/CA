# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.cache/wt [current_project]
set_property parent.project_path E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files E:/vivado/mimiMIPS_B3_v1.2/rom.coe
read_verilog -library xil_defaultlib {
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/defines.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/EX.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/EX_MEM.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/ID.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/ID_EX.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/IF_ID.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/MEM.V
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/MEM_WB.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/PC.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/RegFile.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/WB.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/confreg.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/miniMIPS_Top.v
  E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/new/Basys3_Top.v
}
read_ip -quiet E:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/ip/inst_rom/inst_rom.xci
set_property used_in_implementation false [get_files -all e:/vivado/mimiMIPS_B3_v1.2/project_1/project_1.srcs/sources_1/ip/inst_rom/inst_rom_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc E:/vivado/mimiMIPS_B3_v1.2/Basys-3.xdc
set_property used_in_implementation false [get_files E:/vivado/mimiMIPS_B3_v1.2/Basys-3.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top Basys3_Top -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef Basys3_Top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file Basys3_Top_utilization_synth.rpt -pb Basys3_Top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]