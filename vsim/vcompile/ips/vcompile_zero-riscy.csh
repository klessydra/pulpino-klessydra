#!/bin/tcsh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=zero_riscy

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
set IP_PATH="${IPS_PATH}/zero-riscy"
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


echo "${Green}Compiling component: ${Brown} zeroriscy ${NC}"
echo "${Red}"
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/include/zeroriscy_defines.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/include/zeroriscy_tracer_defines.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_alu.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_compressed_decoder.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_controller.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_cs_registers.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_debug_unit.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_decoder.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_int_controller.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_ex_block.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_id_stage.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_if_stage.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_load_store_unit.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_multdiv_slow.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_multdiv_fast.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_prefetch_buffer.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_fetch_fifo.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_core.sv || goto error

echo "${Green}Compiling component: ${Brown} zeroriscy_regfile_rtl ${NC}"
echo "${Red}"
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_register_file.sv || goto error

echo "${Green}Compiling component: ${Brown} zeroriscy_vip_rtl ${NC}"
echo "${Red}"
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/include/zeroriscy_defines.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/include/zeroriscy_tracer_defines.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/include ${IP_PATH}/zeroriscy_tracer.sv || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
