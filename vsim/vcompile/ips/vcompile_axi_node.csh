#!/bin/tcsh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=axi_node

##############################################################################
# Check settings
##############################################################################

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?IPS_PATH ) then
  echo "${Red} IPS_PATH is not defined ${NC}"
  exit 1
endif

set LIB_NAME="${IP}_lib"
set LIB_PATH="${MSIM_LIBS_PATH}/${LIB_NAME}"
set IP_PATH="${IPS_PATH}/axi/axi_node"
set RTL_PATH="${RTL_PATH}"

##############################################################################
# Preparing library
##############################################################################

echo "${Green}--> Compiling ${IP}... ${NC}"

rm -rf $LIB_PATH

vlib $LIB_PATH
vmap $LIB_NAME $LIB_PATH

##############################################################################
# Compiling RTL
##############################################################################

echo "${Green}Compiling component: ${Brown} axi_node ${NC}"
echo "${Red}"
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/apb_regs_top.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_address_decoder_AR.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_address_decoder_AW.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_address_decoder_BR.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_address_decoder_BW.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_address_decoder_DW.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_AR_allocator.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_ArbitrationTree.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_AW_allocator.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_BR_allocator.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_BW_allocator.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_DW_allocator.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_FanInPrimitive_Req.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_multiplexer.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_node.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_node_wrap.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_node_wrap_with_slices.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_regs_top.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_request_block.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_response_block.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/axi_RR_Flag_Req.sv || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
