if (${GCC_MARCH} MATCHES "RV32IM" OR ${GCC_MARCH} MATCHES "[pulp]+" OR ${GCC_MARCH} MATCHES "rv32ima" OR ${GCC_MARCH} MATCHES "rv32imaf")
  add_application(testDivRem testDivRem.c LABELS "riscv_tests")
endif()
