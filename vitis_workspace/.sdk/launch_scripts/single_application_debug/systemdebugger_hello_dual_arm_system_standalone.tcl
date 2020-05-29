connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "JTAG-ONB4 2516330029F9A" && level==0} -index 1
fpga -file /home/parallels/dual_arm_zynq/vitis_workspace/hello_dual_arm/_ide/bitstream/zb_simple_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/parallels/dual_arm_zynq/vitis_workspace/dual_arm_zynq/export/dual_arm_zynq/hw/zb_simple_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/parallels/dual_arm_zynq/vitis_workspace/hello_dual_arm/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/parallels/dual_arm_zynq/vitis_workspace/hello_dual_arm/Debug/hello_dual_arm.elf
targets -set -nocase -filter {name =~ "*A9*#1"}
dow /home/parallels/dual_arm_zynq/vitis_workspace/hello_dual_arm1/Debug/hello_dual_arm1.elf
configparams force-mem-access 0
bpadd -addr &main
