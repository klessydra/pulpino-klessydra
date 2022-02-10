#!/bin/tcsh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=adv_dbg_if

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
set IP_PATH="${IPS_PATH}/adv_dbg_if"
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

echo "${Green}Compiling component: ${Brown} adv_dbg_if ${NC}"
echo "${Red}"
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_axi_biu.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_axi_module.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_lint_biu.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_lint_module.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_crc32.v || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_or1k_biu.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_or1k_module.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_or1k_status_reg.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_top.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/bytefifo.v || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/syncflop.v || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/syncreg.v || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_tap_top.v || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adv_dbg_if.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_axionly_top.sv || goto error
vlog -quiet -sv -suppress 2583 -work ${LIB_PATH}    +incdir+${IP_PATH}/rtl ${IP_PATH}/rtl/adbg_lintonly_top.sv || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
