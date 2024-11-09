cmake_minimum_required (VERSION 2.8)

include(CMakeParseArguments)

if (${CMAKE_VERSION} VERSION_GREATER 3.1.0)
  set(USES_TERMINAL "USES_TERMINAL")
else()
  set(USES_TERMINAL "")
endif()

# Force object file extension to be .o
set(UNIX TRUE CACHE STRING "" FORCE)

# System name
# If we set the system to Clang/GCC we get "-rdynamic"
# however we need Linux for dynamic linking stuffs.
# We should probably create a custom system name
set(CMAKE_SYSTEM_NAME "Linux-CXX")

enable_language(C CXX ASM)
project (pulp_software C)

enable_testing()

set(RISCV 1)

if(${RISCY_RV32F} AND (${USE_ZERO_RISCY} OR ${USE_KLESSYDRA}))
  message(SEND_ERROR "Floating Point Extensions are not supported on the selected core")
endif()

# assign default architecture flags if not defined
string(COMPARE EQUAL "${GCC_MARCH}" "" GCC_MARCH_NOT_SET)

if(GCC_MARCH_NOT_SET)
   message("\nUsing default architecture flags!!\n")

   if(${USE_KLESSYDRA_TEST})
     set(GCC_MARCH "rv32ima")
   elseif(${USE_RISCY})
      if(${RISCY_RV32F})
         set(GCC_MARCH "IMFDXpulpv2")
      else()
         set(GCC_MARCH "IMXpulpv2")
      endif()
   else()
      if(${ZERO_RV32M})
        set(GCC_MARCH "RV32IM")
      else()
        set(GCC_MARCH "RV32I")
      endif()
   endif()
endif()

string(ASCII 27 ESCAPE)
set(ColourReset "${ESCAPE}[m")
set(ColourBold  "${ESCAPE}[1m")
set(Red         "${ESCAPE}[31m")
set(Green       "${ESCAPE}[32m")
set(Yellow      "${ESCAPE}[33m")
set(Blue        "${ESCAPE}[34m")
set(Magenta     "${ESCAPE}[35m")
set(Cyan        "${ESCAPE}[36m")
set(White       "${ESCAPE}[37m")
set(LightRed     "${ESCAPE}[1;91m")
set(LightGreen   "${ESCAPE}[1;92m")
set(LightYellow  "${ESCAPE}[1;93m")
set(LightBlue    "${ESCAPE}[1;94m")
set(LightMagenta "${ESCAPE}[1;95m")
set(LightCyan    "${ESCAPE}[1;96m")
set(LightWhite   "${ESCAPE}[1;97m")

MESSAGE("")
MESSAGE("*****************************")
MESSAGE("** COMPILER CONFIGURATIONS **")
MESSAGE("*****************************")
MESSAGE(STATUS "${LightRed}GCC_MARCH${ColourReset} = ${GCC_MARCH}")
MESSAGE(STATUS "${LightRed}GCC_FLAGS${ColourReset} = ${CMAKE_C_FLAGS}")
MESSAGE(STATUS "${LightRed}COMPILER${ColourReset} = ${CMAKE_C_COMPILER}")
MESSAGE(STATUS "${LightRed}OBJCOPY${ColourReset} = ${CMAKE_OBJCOPY}")
MESSAGE(STATUS "${LightRed}OBJDUMP${ColourReset} = ${CMAKE_OBJDUMP}")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=${GCC_MARCH} -Wa,-march=${GCC_MARCH}")
set(CMAKE_OBJDUMP_FLAGS -Mmarch=${GCC_MARCH} -Sd)

if(${GCC_MARCH} MATCHES "IMFDXpulpv2")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mhard-float")
endif()

if(${RVC})
  message("NOTE: Using compressed instructions")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mrvc")
endif()

if(${ZERO_RV32E})
  if (${USE_RISCY})
    message(SEND_ERROR "RV32E can only be used with Zero-riscy")
  endif()
  message("NOTE: Using RV32E ISA")
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m16r")
endif()

set(LDSCRIPT      "link.riscv.ld")
set(LDSCRIPT_BOOT "link.boot.ld" )


set(PULP_PC_ANALYZE "pulp-pc-analyze" CACHE PATH "path to pulp pc analyze binary")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wextra -Wall -Wno-unused-parameter -Wno-unused-variable -Wno-unused-function -fdata-sections -ffunction-sections -fdiagnostics-color=always")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -L${CMAKE_CURRENT_SOURCE_DIR}/ref -T${LDSCRIPT} -nostartfiles -Wl,--gc-sections")
set(BOOT_LINKER_FLAGS      "-L${CMAKE_CURRENT_SOURCE_DIR}/ref -T${LDSCRIPT_BOOT} -nostartfiles -Wl,--gc-sections")

set(CMAKE_CXX_COMPILER "${CMAKE_C_COMPILER}")

if (${USE_KLESSYDRA_TEST})
  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS} -fno-sized-deallocation -std=gnu++17")
else()
  set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}")
endif()

set(COREMARK_DEFS "${ITERATIONS}")
set(KLESS_DEFINES "${TPS}" "${VSIZE}" "${TIME}" "${A_ORDER}" "${B_ORDER}" "${KLESS_SPM_A}" "${KLESS_SPM_B}" "${KLESS_SPM_C}" "${KLESS_SPM_D}"
                  "-DROM_SIZE=${ROM_SIZE}" "-DROM_ORG=${ROM_ORG}" 
                  "-DGLOBALRAM_SIZE=${GLOBALRAM_SIZE}" "-DGLOBALRAM_ORG=${GLOBALRAM_ORG}"
                  "-DINSTRRAM_SIZE=${INSTRRAM_SIZE}" "-DINSTRRAM_ORG=${INSTRRAM_ORG}" 
                  "-DHART_STACK_SIZE=${HART_STACK_SIZE}" "-DSTACK_END=${STACK_END}" "-DPULPINO_BASE_ADDR=${PERIPHERALS}")
set(CMAKE_ASM_COMPILER "${CMAKE_C_COMPILER}")
set(CMAKE_ASM_FLAGS    "${CMAKE_C_FLAGS}")

set(PULP_MODELSIM_DIRECTORY "" CACHE PATH "Path to the ModelSim PULPino build")
set(VSIM "vsim" CACHE FILEPATH "Path to the vsim executable")

# Configure linker scripts dynamically
configure_file(${CMAKE_SOURCE_DIR}/ref/link.boot.ld.in
               ${CMAKE_SOURCE_DIR}/ref/link.boot.ld @ONLY)

configure_file(${CMAKE_SOURCE_DIR}/ref/link.common.ld.in
               ${CMAKE_SOURCE_DIR}/ref/link.common.ld @ONLY)
################################################################################

 if(${ZERO_RV32E})
   set(crt0      "ref/crt0.riscv_E.S")
   set(crt0_boot "ref/crt0.boot_E.S")
 elseif(${KLESS_RV32E})
   set(crt0      "ref/crt0.klessydra_E.S")
   set(crt0_boot "ref/crt0.boot_E.S")
 elseif(${USE_KLESSYDRA})
   set(crt0      "ref/crt0.klessydra.S")
   set(crt0_boot "ref/crt0.boot.S")
 else()
   set(crt0      "ref/crt0.riscv.S")
   set(crt0_boot "ref/crt0.boot.S")
 endif()

 include_directories(libs/klessydra_lib/general_libs/inc)
    if (${USE_KLESSYDRA_M} OR ${USE_KLESSYDRA_T1_3TH} OR ${USE_KLESSYDRA_NETLIST} OR ${USE_KLESSYDRA_OoO} OR ${USE_KLESSYDRA_S1} OR ${USE_KLESSYDRA_FT13})
   include_directories(libs/klessydra_lib/dsp_libs/inc)
   include_directories(libs/klessydra_lib/vgg16_libs/inc)
   include_directories(libs/klessydra_lib/cb_libs/inc)
 endif()
   include_directories(libs/klessydra_lib/dsp_libs/inc) 
   
 include_directories(libs/sys_lib/inc)
 if(${ARDUINO_LIB})
   include_directories(libs/Arduino_lib/core_libs/inc)
   include_directories(libs/Arduino_lib/separate_libs/inc)
 endif()

 if(${RISCY_RV32F})
   include_directories(libs/math_fns_lib/inc)
 endif()

 set_source_files_properties(${crt0} PROPERTIES LANGUAGE C)
 add_library(crt0 OBJECT ${crt0})
 target_compile_definitions(crt0 PRIVATE ${KLESS_DEFINES})

 add_library(crt0_boot OBJECT ${crt0_boot})
 target_compile_definitions(crt0 PRIVATE ${KLESS_DEFINES})
 set_target_properties(crt0_boot PROPERTIES COMPILE_FLAGS "-DBOOT")


################################################################################
# Other targets
################################################################################


add_custom_target(vcompile
  COMMAND tcsh -c "./vcompile/build_rtl_sim.csh" #${kless_configs}"
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.ps
  COMMAND tcsh -c "env PL_NETLIST=${PL_NETLIST} ./vcompile/vcompile_ps.csh"
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.pl
  COMMAND tcsh -c "env PL_NETLIST=${PL_NETLIST} ./vcompile/vcompile_pl.csh"
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.core.riscy
  COMMAND tcsh ./vcompile/vcompile_riscv.csh
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.core.klessydra-t0-2th
  COMMAND tcsh -c ./vcompile/vcompile_klessydra-t0-2th.csh
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.core.klessydra-t0-3th
  COMMAND tcsh -c ./vcompile/vcompile_klessydra-t0-3th.csh
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.core.klessydra-t1-3th
  COMMAND tcsh -c "./vcompile/vcompile_klessydra-t1-3th.csh" #${kless_configs}"
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.core.klessydra-m
  COMMAND tcsh -c "./vcompile/vcompile_klessydra-m.csh" #${kless_configs}"
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.core.klessydra-s1
  COMMAND tcsh -c "./vcompile/vcompile_klessydra-s1.csh" #${kless_configs}"
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.core.klessydra-OoO
  COMMAND tcsh -c "./vcompile/vcompile_klessydra-OoO.csh" #${kless_configs}"
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.core.klessydra-f0-3th
  COMMAND tcsh -c ./vcompile/vcompile_klessydra-f0-3th.csh
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.core.zero
  COMMAND tcsh ./vcompile/vcompile_zero-riscy.csh
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

add_custom_target(vcompile.core.netlist
  COMMAND tcsh -c "./vcompile/vcompile_netlist.csh" #${kless_configs}"
  WORKING_DIRECTORY ${PULP_MODELSIM_DIRECTORY}
  ${USES_TERMINAL})

################################################################################

add_subdirectory(libs/klessydra_lib/general_libs)

if (${USE_KLESSYDRA_M} OR ${USE_KLESSYDRA_T1_3TH} OR ${USE_KLESSYDRA_NETLIST} OR ${USE_KLESSYDRA_OoO} OR ${USE_KLESSYDRA_S1} OR ${USE_KLESSYDRA_FT13})
  add_subdirectory(libs/klessydra_lib/dsp_libs)
  add_subdirectory(libs/klessydra_lib/vgg16_libs)
  add_subdirectory(libs/klessydra_lib/cb_libs)
endif()
  
add_subdirectory(libs/string_lib)
add_subdirectory(libs/sys_lib)
add_subdirectory(libs/bench_lib)

if(${RISCY_RV32F})
 add_subdirectory(libs/math_fns_lib)
endif()

if(${ARDUINO_LIB})
 add_subdirectory(libs/Arduino_lib)
endif()




set(BEEBS_LIB 0)

if(${BEEBS_LIB})
 add_subdirectory(libs/beebs_lib)
endif()

add_subdirectory(apps)
