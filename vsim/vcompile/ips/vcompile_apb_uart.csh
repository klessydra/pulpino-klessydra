#!/bin/tcsh
source ${PULP_PATH}/./vsim/vcompile/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=apb_uart

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
set IP_PATH="${IPS_PATH}/apb/apb_uart"
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

echo "${Green}Compiling component: ${Brown} apb_uart ${NC}"
echo "${Red}"
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/apb_uart.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/slib_clock_div.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/slib_counter.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/slib_edge_detect.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/slib_fifo.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/slib_input_filter.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/slib_input_sync.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/slib_mv_filter.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/uart_baudgen.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/uart_interrupt.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/uart_receiver.vhd || goto error
vcom -quiet -suppress 2583 -work ${LIB_PATH}   ${IP_PATH}/uart_transmitter.vhd || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
