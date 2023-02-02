#!/bin/bash

#export PATH=/compilerpath/:${PATH}


if [ ! "$automate_en" ]
then

	#  -----------------------------------------------------------------------------------------------------------------------------
	#  -- ██╗  ██╗██╗     ███████╗███████╗███████╗██╗   ██╗██████╗ ██████╗  █████╗      ██████╗ ██████╗ ██████╗ ███████╗███████╗  --
	#  -- ██║ ██╔╝██║     ██╔════╝██╔════╝██╔════╝╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗    ██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝  --
	#  -- █████╔╝ ██║     █████╗  ███████╗███████╗ ╚████╔╝ ██║  ██║██████╔╝███████║    ██║     ██║   ██║██████╔╝█████╗  ███████╗  --
	#  -- ██╔═██╗ ██║     ██╔══╝  ╚════██║╚════██║  ╚██╔╝  ██║  ██║██╔══██╗██╔══██║    ██║     ██║   ██║██╔══██╗██╔══╝  ╚════██║  --
	#  -- ██║  ██╗███████╗███████╗███████║███████║   ██║   ██████╔╝██║  ██║██║  ██║    ╚██████╗╚██████╔╝██║  ██║███████╗███████║  --
	#  -- ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝  --
    #  -----------------------------------------------------------------------------------------------------------------------------

	USE_KLESSYDRA=1 # Set this to one if you are using a klessydra core (uses the klessydra startup file)
	USE_KLESSYDRA_T0_2TH=0 # if you are using klessydra-t0-2th (The three pipeline version of klessydra t0), set this to 1
	USE_KLESSYDRA_T0_3TH=0 # if you are using klessydra-t0-3th (The four pipeline version of klessydra t0), set this to 1
	USE_KLESSYDRA_T1_3TH=0 # if you are using klessydra-t1-3th (The four pipeline version of klessydra t1), set this to 1CV
	USE_KLESSYDRA_M=1   # if you are using klessydra-m (A hart morphing version of klessydra T1), set this to 1CV
	USE_KLESSYDRA_S1=0     # if you are using klessydra-s1 (Single hart version of klessydra t1), set this to 1CV
	USE_KLESSYDRA_OoO=0    # if you are using klessydra-t1-3th (The four pipeline version of klessydra t1), set this to 1CV
	USE_KLESSYDRA_F0_3TH=0 # if you are using klessydra-f0-3th (The four pipeline version of klessydra f0), set this to 1
	USE_KLESSYDRA_FT13=0 # if you are using klessydra-fT13 (The temporally fault tolerant version of the T13), then set this to 1
	USE_KLESSYDRA_NETLIST=0 # if you are using klessydra-t1-3th (The four pipeline version of klessydra t1), set this to 1

	#  -------------------------------------------------------------------------------------------------------------------------------------------
	#  -- ██╗  ██╗██╗     ███████╗███████╗███████╗██╗   ██╗██████╗ ██████╗  █████╗      ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ ███████╗  --
	#  -- ██║ ██╔╝██║     ██╔════╝██╔════╝██╔════╝╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ ██╔════╝  --
	#  -- █████╔╝ ██║     █████╗  ███████╗███████╗ ╚████╔╝ ██║  ██║██████╔╝███████║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗███████╗  --
	#  -- ██╔═██╗ ██║     ██╔══╝  ╚════██║╚════██║  ╚██╔╝  ██║  ██║██╔══██╗██╔══██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║╚════██║  --
	#  -- ██║  ██╗███████╗███████╗███████║███████║   ██║   ██████╔╝██║  ██║██║  ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝███████║  --
	#  -- ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝  --
	#  -------------------------------------------------------------------------------------------------------------------------------------------

	#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	KLESS_CONTEXT_SWITCH=0          # Enables the context switching between cores
	KLESS_THREAD_POOL_SIZE=3        # Changing the TPS to less than "number of pipeline stages-1" is not allowed. And making it bigger than "pipeline stages-1" is okay but not recommended
	KLESS_LUTRAM_RF=0 				# Changes the regfile from flip-flop type into LUTRAM type
	KLESS_LATCH_RF=0                # Changes the regfile from flip-flop type into Latch type (only works if lutram_rf is set to 0)
	KLESS_RV32E=0                   # Regfile size, Can be set to 32 for RV32E being 0 else 16 for RV32E being set to 1, also chnges the RISCV compiler and Klessydra startup file accordingly
	KLESS_RV32M=1                   # Enable the M-extension of the risc-v instruction set
	KLESS_superscalar_exec_en=1		# Enables superscalar execution when set to 1, else the stall of the pipeline will depend on tha latency of the instruction
	KLESS_morph_en=1                # Enables hardware metamorphosis, that lets the IMT processor morph into an in-order execution processor to avoid stalling
	KLESS_fetch_stage_en=0          # Enables the an additional fetch stage which handles some of the data dependency logic (needs morph_en to be set or THREAD_POOL_SIZE < THREAD_POOL_BASELINE)
	KLESS_branch_predict_en=1       # Enables a 1-bit branch predictor (if set without btb_en), that predicts a taken branch if the offset is negative, else it preicts a positive offset
	KLESS_btb_en=0                  # Enables the branch target buffer of size defined in 2^btb_len, to enable the btb, branch_predict_en must be set to '1'
	KLESS_btb_len=6                 # Sets the BTB size which is 2^btb_len
	KLESS_accl_en=1                 # Enable the generation of the special purpose accelerator
	KLESS_replicate_accl_en=1       # Set to 1 to replicate the accelerator for every thread
	KLESS_multithreaded_accl_en=1   # Set to 1 to let the replicated accelerator share the functional units (note: replicate_accl_en must be set to '1')
	KLESS_SPM_NUM=4                 # The number of scratchpads available "Minimum allowed is two"
	KLESS_Addr_Width=14             # This address is for scratchpads. Setting this will make the size of the spm to be: "2^Addr_Width -1"
	#   KLESS_SPM_STRT_ADDR          std_logic_vector(31 downto 0) := x"1000_0000";  -- This is starting address of the spms, it shouldn't overlap any sections in the memory map
	KLESS_SIMD=2                    # Changing the SIMD, would change the number of the functional units in the dsp, and the number of banks in the spms (can be power of 2 only e.g. 1,2,4,8)
	KLESS_MCYCLE_EN=1               # Can be set to 1 or 0 only. Setting to zero will disable MCYCLE and MCYCLEH
	KLESS_MINSTRET_EN=1             # Can be set to 1 or 0 only. Setting to zero will disable MINSTRET and MINSTRETH
	KLESS_MHPMCOUNTER_EN=1          # Can be set to 1 or 0 only. Setting to zero will disable all performance counters except "MCYCLE/H" and "MINSTRET/H"
	KLESS_count_all=0               # Perfomance counters count for all the harts instead of there own hart
	KLESS_debug_en=1                # Generates the debug unit
	KLESS_tracer_en=1				# Generate the instruction tracer used only for debugging purposes
    #  -------------------------------------------------------------------------------------------------------------------------------------------------------
    #  --  ██████╗ ██╗███████╗ ██████╗██╗   ██╗     ██████╗ ██████╗ ██████╗ ███████╗███████╗    ██╗ ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ ███████╗  --
    #  --  ██╔══██╗██║██╔════╝██╔════╝╚██╗ ██╔╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝   ██╔╝██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ ██╔════╝  --
    #  --  ██████╔╝██║███████╗██║      ╚████╔╝     ██║     ██║   ██║██████╔╝█████╗  ███████╗  ██╔╝ ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗███████╗  --
    #  --  ██╔══██╗██║╚════██║██║       ╚██╔╝      ██║     ██║   ██║██╔══██╗██╔══╝  ╚════██║ ██╔╝  ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║╚════██║  --
    #  --  ██║  ██║██║███████║╚██████╗   ██║       ╚██████╗╚██████╔╝██║  ██║███████╗███████║██╔╝   ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝███████║  --
    #  --  ╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ ╚══════╝  --
    #  -------------------------------------------------------------------------------------------------------------------------------------------------------

	USE_RI5CY=0 	 # Set this to one if you are using the riscy core (no hard floats)
	USE_ZERO_RISCY=0 # if you are using zero-riscy, set this to 1
	RISCY_RV32F=0	 # set this to 1 if you are using the Floating Point extensions for riscy only
	ZERO_RV32M=0 	 # zeroriscy with the multiplier
	ZERO_RV32E=0 	 # zeroriscy with only 16 registers
	RVC=0			 # if you want to have compressed instructions, set this to 1

    #   -----------------------------------------------------------------------------------
    #	--  ███████╗██╗    ██╗    ██████╗ ███████╗███████╗██╗███╗   ██╗███████╗███████╗  --
    #	--  ██╔════╝██║    ██║    ██╔══██╗██╔════╝██╔════╝██║████╗  ██║██╔════╝██╔════╝  --
    #	--  ███████╗██║ █╗ ██║    ██║  ██║█████╗  █████╗  ██║██╔██╗ ██║█████╗  ███████╗  --
    #	--  ╚════██║██║███╗██║    ██║  ██║██╔══╝  ██╔══╝  ██║██║╚██╗██║██╔══╝  ╚════██║  --
    #	--  ███████║╚███╔███╔╝    ██████╔╝███████╗██║     ██║██║ ╚████║███████╗███████║  --
    #	--  ╚══════╝ ╚══╝╚══╝     ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝  --
    #	-----------------------------------------------------------------------------------

	FM_Size=32       				 # Defines the size of the Feature Maps in the convolution tests (can only be multiples of 2, FMs > 32 are not tested)
	Filter_Size=3   				 # Defines the size of the Filters in the convolution tests (can only be 3,5,7,9,11)
	VSIZE=1 		 				 # Defines the vector size used in the instruction verification klessydra T13 tests
	TIME=$(( RANDOM % 2147483647))   # Defines the time used for random generation in different tests

	COREMARK_ITR=1					 # Defines the number of iterations ran by coremark

	file=test
fi

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

if [ $USE_RI5CY -eq 1 ]
then
	OBJDUMP=`which ri5cy-unknown-elf-objdump`
	OBJCOPY=`which  ri5cy-unknown-elf-objcopy`
	COMPILER=`which ri5cy-unknown-elf-gcc`
	RANLIB=`which ri5cy-unknown-elf-ranlib`
	TARGET_C_FLAGS="-O2 -m32 -g"
	#TARGET_C_FLAGS="-O2 -g -falign-functions=16  -funroll-all-loops"
	# riscy with PULPextensions, it is assumed you use the ETH GCC Compiler
	GCC_MARCH="IMXpulpv2"
elif [ $USE_ZERO_RISCY -eq 1 -a $KLESS_RV32E -eq 0 -a $ZERO_RV32M -eq 1 ]
then
	OBJDUMP=`which riscv32-unknown-elf-objdump`
	OBJCOPY=`which riscv32-unknown-elf-objcopy`
	COMPILER=`which riscv32-unknown-elf-gcc`
	RANLIB=`which riscv32-unknown-elf-ranlib`
	TARGET_C_FLAGS="-O2 -m32 -g"
	#TARGET_C_FLAGS="-O2 -g -falign-functions=16  -funroll-all-loops"
	# riscy with PULPextensions, it is assumed you use the ETH GCC Compiler
	GCC_MARCH="RV32IM"
elif [ $USE_ZERO_RISCY -eq 1 -a $KLESS_RV32E -eq 0 -a $ZERO_RV32M -eq 0 ]
then
	OBJDUMP=`which riscv32-unknown-elf-objdump`
	OBJCOPY=`which riscv32-unknown-elf-objcopy`
	COMPILER=`which riscv32-unknown-elf-gcc`
	RANLIB=`which riscv32-unknown-elf-ranlib`
	TARGET_C_FLAGS="-O2 -m32 -g"
	#TARGET_C_FLAGS="-O2 -g -falign-functions=16  -funroll-all-loops"
	# riscy with PULPextensions, it is assumed you use the ETH GCC Compiler
	GCC_MARCH="RV32I"
elif [ $USE_ZERO_RISCY -eq 1 -a $KLESS_RV32E -eq 1 ]
then
	OBJDUMP=`which klessydra-tiny-unknown-elf-objdump`
	OBJCOPY=`which klessydra-tiny-unknown-elf-objcopy`
	COMPILER=`which klessydra-tiny-unknown-elf-gcc`
	RANLIB=`which klessydra-tiny-unknown-elf-ranlib`
	TARGET_C_FLAGS="-O2 -g"
	GCC_MARCH="rv32ea"
elif [ $KLESS_RV32E -eq 1 -a $KLESS_RV32M -eq 1 ]
then
	OBJDUMP=`which klessydra-tiny-unknown-elf-objdump`
	OBJCOPY=`which klessydra-tiny-unknown-elf-objcopy`
	COMPILER=`which klessydra-tiny-unknown-elf-gcc`
	RANLIB=`which klessydra-tiny-unknown-elf-ranlib`
	TARGET_C_FLAGS="-O2 -g"
	GCC_MARCH="rv32ema"
	USE_KLESSYDRA_TEST=1
elif [ $KLESS_RV32E -eq 1 -a $KLESS_RV32M -eq 0 ]
then
	OBJDUMP=`which klessydra-tiny-unknown-elf-objdump`
	OBJCOPY=`which klessydra-tiny-unknown-elf-objcopy`
	COMPILER=`which klessydra-tiny-unknown-elf-gcc`
	RANLIB=`which klessydra-tiny-unknown-elf-ranlib`
	TARGET_C_FLAGS="-O2 -g"
	GCC_MARCH="rv32ea"
	USE_KLESSYDRA_TEST=1
elif [ $KLESS_RV32E -eq 0 -a $KLESS_RV32M -eq 0 ]
then
	OBJDUMP=`which klessydra-unknown-elf-objdump`
	OBJCOPY=`which klessydra-unknown-elf-objcopy`
	COMPILER=`which klessydra-unknown-elf-gcc`
	RANLIB=`which klessydra-unknown-elf-ranlib`
	TARGET_C_FLAGS="-O2 -g"
	GCC_MARCH="rv32ia"
	USE_KLESSYDRA_TEST=1
else
	OBJDUMP=`which klessydra-unknown-elf-objdump`
	OBJCOPY=`which klessydra-unknown-elf-objcopy`
	COMPILER=`which klessydra-unknown-elf-gcc`
	RANLIB=`which klessydra-unknown-elf-ranlib`
	TARGET_C_FLAGS="-O2 -g"
	GCC_MARCH="rv32ima"
	USE_KLESSYDRA_TEST=1
fi

VSIM=`which vsim`

# klessydra configurations passed from another script
#kless_configs=($@)
#echo kless_configs=${kless_configs[0]}

let SPMA=(2**$KLESS_Addr_Width * 0 + 0x10000000)
let SPMB=(2**$KLESS_Addr_Width * 1 + 0x10000000)
let SPMC=(2**$KLESS_Addr_Width * 2 + 0x10000000)
let SPMD=(2**$KLESS_Addr_Width * 3 + 0x10000000)
KLESS_SPM_A="-DKLESS_SPM_A="$SPMA
KLESS_SPM_B="-DKLESS_SPM_B="$SPMB
KLESS_SPM_C="-DKLESS_SPM_C="$SPMC
KLESS_SPM_D="-DKLESS_SPM_D="$SPMD
printf '%s' '--'
printf " SPMA= 0x%x" $SPMA
printf $'\n'
printf '%s' '--'
printf " SPMB= 0x%x" $SPMB
printf $'\n'
printf '%s' '--'
printf " SPMC= 0x%x" $SPMC
printf $'\n'
printf '%s' '--'
printf " SPMD= 0x%x" $SPMD
printf $'\n'

A_ORDER="-DA_ORDER="$FM_Size       # Defines the size of the Feature Maps in the convolution tests (can only be multiples of 2, FMs > 32 are not tested)
echo '--' A_ORDER=$FM_Size
B_ORDER="-DB_ORDER="$Filter_Size   # Defines the size of the Filters in the convolution tests (can only be 3,5,7,9,11)
echo '--' B_ORDER=$Filter_Size
KLESS_VSIZE="-DNumOfElements="$VSIZE
echo '--' KLESS_VSIZE=$VSIZE
KLESS_TIME="-DTIME="$TIME
echo '--' KLESS_TIME=$TIME
TPS="-DTHREAD_POOL_SIZE="$KLESS_THREAD_POOL_SIZE

COREMARK_ITR="-DITERATIONS="$COREMARK_ITR

#compile arduino lib
ARDUINO_LIB=1

PULP_GIT_DIRECTORY=../../
SIM_DIRECTORY="$PULP_GIT_DIRECTORY/vsim"
#insert here your post-layout netlist if you are using IMPERIO
PL_NETLIST=""


cmake "$PULP_GIT_DIRECTORY"/sw/ \
	-DNETLIST_FILE="$file" \
	-DTPS="$TPS" \
	-DNUMOFELEMENTS="$KLESS_VSIZE" \
	-DTIME="$KLESS_TIME" \
	-DA_ORDER="$A_ORDER" \
	-DB_ORDER="$B_ORDER" \
	-DKLESS_SPM_A="$KLESS_SPM_A" \
	-DKLESS_SPM_B="$KLESS_SPM_B" \
	-DKLESS_SPM_C="$KLESS_SPM_C" \
	-DKLESS_SPM_D="$KLESS_SPM_D" \
    -DPULP_MODELSIM_DIRECTORY="$SIM_DIRECTORY" \
    -DCMAKE_C_COMPILER="$COMPILER" \
    -DVSIM="$VSIM" \
    -DRVC="$RVC" \
    -DITERATIONS="$COREMARK_ITR" \
    -DRISCY_RV32F="$RISCY_RV32F" \
    -DUSE_KLESSYDRA="$USE_KLESSYDRA" \
    -DUSE_KLESSYDRA_TEST="$USE_KLESSYDRA_TEST" \
    -DUSE_KLESSYDRA_T0_2TH="$USE_KLESSYDRA_T0_2TH" \
    -DUSE_KLESSYDRA_T0_3TH="$USE_KLESSYDRA_T0_3TH" \
    -DUSE_KLESSYDRA_T1_3TH="$USE_KLESSYDRA_T1_3TH" \
    -DUSE_KLESSYDRA_M="$USE_KLESSYDRA_M" \
    -DUSE_KLESSYDRA_S1="$USE_KLESSYDRA_S1" \
    -DUSE_KLESSYDRA_OoO="$USE_KLESSYDRA_OoO" \
	-DUSE_KLESSYDRA_F0_3TH="$USE_KLESSYDRA_F0_3TH" \
	-DUSE_KLESSYDRA_FT13="$USE_KLESSYDRA_FT13" \
	-DUSE_KLESSYDRA_NETLIST="$USE_KLESSYDRA_NETLIST" \
    -DUSE_ZERO_RISCY="$USE_ZERO_RISCY" \
    -DZERO_RV32M="$ZERO_RV32M" \
    -DZERO_RV32E="$ZERO_RV32E" \
    -DKLESS_CONTEXT_SWITCH="$KLESS_CONTEXT_SWITCH" \
	-DKLESS_THREAD_POOL_SIZE="$KLESS_THREAD_POOL_SIZE" \
	-DKLESS_LUTRAM_RF="$KLESS_LUTRAM_RF" \
	-DKLESS_LATCH_RF="$KLESS_LATCH_RF" \
	-DKLESS_RV32E="$KLESS_RV32E" \
	-DKLESS_RV32M="$KLESS_RV32M" \
	-DKLESS_superscalar_exec_en="$KLESS_superscalar_exec_en" \
    -DKLESS_morph_en="$KLESS_morph_en" \
    -DKLESS_fetch_stage_en="$KLESS_fetch_stage_en" \
    -DKLESS_branch_predict_en="$KLESS_branch_predict_en" \
    -DKLESS_btb_en="$KLESS_btb_en" \
    -DKLESS_btb_len="$KLESS_btb_len" \
	-DKLESS_accl_en="$KLESS_accl_en" \
	-DKLESS_replicate_accl_en="$KLESS_replicate_accl_en" \
	-DKLESS_multithreaded_accl_en="$KLESS_multithreaded_accl_en" \
	-DKLESS_SPM_NUM="$KLESS_SPM_NUM" \
	-DKLESS_Addr_Width="$KLESS_Addr_Width" \
    -DKLESS_SIMD="$KLESS_SIMD" \
	-DKLESS_MCYCLE_EN="$KLESS_MCYCLE_EN" \
	-DKLESS_MINSTRET_EN="$KLESS_MINSTRET_EN" \
	-DKLESS_MHPMCOUNTER_EN="$KLESS_MHPMCOUNTER_EN" \
	-DKLESS_count_all="$KLESS_count_all" \
	-DKLESS_debug_en="$KLESS_debug_en" \
	-DKLESS_tracer_en="$KLESS_tracer_en"\
    -DGCC_MARCH="$GCC_MARCH" \
    -DARDUINO_LIB="$ARDUINO_LIB" \
    -DPL_NETLIST="$PL_NETLIST" \
    -DCMAKE_C_FLAGS="$TARGET_C_FLAGS" \
    -DCMAKE_OBJCOPY="$OBJCOPY" \
    -DCMAKE_OBJDUMP="$OBJDUMP"

# Add -G "Ninja" to the cmake call above to use ninja instead of make
