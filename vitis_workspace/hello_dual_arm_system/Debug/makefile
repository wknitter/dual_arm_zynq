#
# This file was created by Xilinx Vitis tool.
#


#
# tools
#

RM = rm -f
RMDIR = rm -rf

#
# variables
#

SDCARD_GEN = sdcard_gen
GENERATE_BIF = ::scw::generate_bif

XPFM_PATH = /home/parallels/dual_arm_zynq/vitis_workspace/dual_arm_zynq/export/dual_arm_zynq/dual_arm_zynq.xpfm
SYS_CONFIG = dual_arm_zynq
DOMAINS = standalone_domain,ps7_cortex9_1
BIF_PATH = /home/parallels/dual_arm_zynq/vitis_workspace/hello_dual_arm_system/Debug/system.bif

BITSTREAM_PATH = /home/parallels/dual_arm_zynq/vitis_workspace/hello_dual_arm/_ide/bitstream/zb_simple_wrapper.bit
SD_FILES = --elf /home/parallels/dual_arm_zynq/vitis_workspace/hello_dual_arm/Debug/hello_dual_arm.elf,ps7_cortexa9_0 --elf /home/parallels/dual_arm_zynq/vitis_workspace/hello_dual_arm1/Debug/hello_dual_arm1.elf,ps7_cortexa9_1

GENERATE_BIF_XSCT_CMD = ${GENERATE_BIF} -xpfm ${XPFM_PATH} -domains ${DOMAINS} -bifpath ${BIF_PATH}

#
# primary build targets
#

all: sd_card

sd_card:
	-@echo Generating bif file for the system project
	-@echo Executing command \'${GENERATE_BIF_XSCT_CMD}\' on XSCT
	-@echo "connect -u TCP:localhost:45191; tcf send_command $$::xsdb::curchan xsdb eval s es [list \"${GENERATE_BIF_XSCT_CMD}\"]" | xsct
	${SDCARD_GEN} --xpfm ${XPFM_PATH} --sys_config ${SYS_CONFIG} --bif ${BIF_PATH} --bitstream ${BITSTREAM_PATH} ${SD_FILES}

clean:
	$(RMDIR) ./_sds
	${RMDIR} sd_card
	${RM} system.bif

.PHONY: all sd_card clean


