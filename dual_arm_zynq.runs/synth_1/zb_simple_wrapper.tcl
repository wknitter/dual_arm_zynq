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
set_param chipscope.maxJobs 2
create_project -in_memory -part xc7z010clg225-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /home/parallels/dual_arm_zynq/dual_arm_zynq.cache/wt [current_project]
set_property parent.project_path /home/parallels/dual_arm_zynq/dual_arm_zynq.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part trenz.biz:te0726_m:part0:3.1 [current_project]
set_property ip_output_repo /home/parallels/dual_arm_zynq/dual_arm_zynq.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib /home/parallels/dual_arm_zynq/dual_arm_zynq.srcs/sources_1/bd/zb_simple/hdl/zb_simple_wrapper.v
add_files /home/parallels/dual_arm_zynq/dual_arm_zynq.srcs/sources_1/bd/zb_simple/zb_simple.bd
set_property used_in_implementation false [get_files -all /home/parallels/dual_arm_zynq/dual_arm_zynq.srcs/sources_1/bd/zb_simple/ip/zb_simple_processing_system7_0_0/zb_simple_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all /home/parallels/dual_arm_zynq/dual_arm_zynq.srcs/sources_1/bd/zb_simple/zb_simple_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top zb_simple_wrapper -part xc7z010clg225-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef zb_simple_wrapper.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file zb_simple_wrapper_utilization_synth.rpt -pb zb_simple_wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]