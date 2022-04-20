add wave -group "Core_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/*
add wave -group "Core_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/*
add wave -group "Core_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/*
add wave -group "Core_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/*
add wave -group "Core_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/*
add wave -group "Core_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/FETCH/*
add wave -group "Core_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/DECODE/*
add wave -group "Core_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/LSU/*
add wave -group "Core_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/EXECUTE/*
add wave -group "Core_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/RF/*
add wave -group "Core_0"  -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/LSU/*

add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/*
add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/*
add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/*
add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/*
add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/*
add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/FETCH/*
add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/DECODE/*
add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/LSU/*
add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/EXECUTE/*
add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/RF/*
add wave -group "Core_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/LSU/*

add wave -group "VCU" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/VCU_inst/DSP/*
add wave -group "VCU" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/VCU_inst/SCI/*

add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/clk_i
add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/LSU/nextstate_LS
add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/LSU/state_LS
add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/data_req_o
add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/data_gnt_i
add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/data_rvalid_i
add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/data_we_o
add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/data_be_o
add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/data_addr_o
add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/data_wdata_o
add wave -group "MEM_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/data_rdata_i

add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/clk_i
add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/LSU/nextstate_LS
add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/LSU/state_LS
add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/data_req_o
add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/data_gnt_i
add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/data_rvalid_i
add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/data_we_o
add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/data_be_o
add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/data_addr_o
add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/data_wdata_o
add wave -group "MEM_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/data_rdata_i

add wave -group "Perf_Cnt_0" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MCYCLE
add wave -group "Perf_Cnt_0" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MINSTRET
add wave -group "Perf_Cnt_0" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MHPMCOUNTER3
add wave -group "Perf_Cnt_0" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MHPMCOUNTER6
add wave -group "Perf_Cnt_0" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MHPMCOUNTER7
add wave -group "Perf_Cnt_0" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MHPMCOUNTER8
add wave -group "Perf_Cnt_0" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MHPMCOUNTER9
add wave -group "Perf_Cnt_0" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MHPMCOUNTER10

add wave -group "Perf_Cnt_1" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MCYCLE
add wave -group "Perf_Cnt_1" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MINSTRET
add wave -group "Perf_Cnt_1" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MHPMCOUNTER3
add wave -group "Perf_Cnt_1" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MHPMCOUNTER6
add wave -group "Perf_Cnt_1" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MHPMCOUNTER7
add wave -group "Perf_Cnt_1" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MHPMCOUNTER8
add wave -group "Perf_Cnt_1" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MHPMCOUNTER9
add wave -group "Perf_Cnt_1" -radix decimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MHPMCOUNTER10

add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MTVEC
add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/PCER
add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MSTATUS
add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MESTATUS
add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MCAUSE
add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MEPC
add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MIP
add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MIRQ
add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MHARTID
add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MVTYPE
add wave -group "CSR_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/MVSIZE

add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MTVEC
add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/PCER
add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MSTATUS
add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MESTATUS
add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MCAUSE
add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MEPC
add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MIP
add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MIRQ
add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MHARTID
add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MVTYPE
add wave -group "CSR_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/MVSIZE

add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/decoded_instruction_LS
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/decoded_instruction_DSP
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/decoded_instruction_IE
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/irq_pending
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/set_branch_condition
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/set_except_condition
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/set_mret_condition
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/set_wfi_condition
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/clk_i
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/rst_ni
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/pc_update_enable
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/pc_wire
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/pc
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/instr_addr_o
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/instr_gnt_i
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/instr_rvalid_i
add wave -group "Debug_0" -color Cyan    -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/PIPE/FETCH/instr_rvalid_FETCH
add wave -group "Debug_0" -color Yellow  -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/PIPE/instr_rvalid_ID_int
add wave -group "Debug_0" -color Magenta -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/PIPE/instr_rvalid_IE
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/CSR/harc_to_csr
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/regfile
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/harc_IF
add wave -group "Debug_0" -color Cyan         -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/FETCH/harc_FETCH
add wave -group "Debug_0" -color Yellow       -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/harc_ID
add wave -group "Debug_0" -color Magenta      -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/harc_EXEC
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/RF/harc_WB
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/RF/WB_EN
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/pc_IF
add wave -group "Debug_0" -color Cyan         -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/FETCH/pc_FETCH
add wave -group "Debug_0" -color Yellow       -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/pc_ID
add wave -group "Debug_0" -color Magenta      -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/pc_IE
add wave -group "Debug_0" -radix unsigned sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/RF/RS1_Addr_IE
add wave -group "Debug_0" -radix unsigned sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/RF/RS2_Addr_IE
add wave -group "Debug_0" -radix unsigned sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/RF/RD_Addr_IE
add wave -group "Debug_0" -color Cyan         -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/FETCH/instr_word_FETCH
add wave -group "Debug_0" -color Yellow       -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/instr_word_ID
add wave -group "Debug_0" -color Magenta      -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/instr_word_IE
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/RF/RS1_Data_IE
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/RF/RS2_Data_IE
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/RF/RD_Data_IE
add wave -group "Debug_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Pipe/RF/WB_RD

add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/decoded_instruction_LS
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/decoded_instruction_DSP
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/decoded_instruction_IE
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/irq_pending
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/set_branch_condition
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/set_except_condition
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/set_mret_condition
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/set_wfi_condition
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/clk_i
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/rst_ni
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/pc_update_enable
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/pc_wire
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/pc
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/instr_addr_o
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/instr_gnt_i
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/instr_rvalid_i
add wave -group "Debug_1" -color Cyan    -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/PIPE/FETCH/instr_rvalid_FETCH
add wave -group "Debug_1" -color Yellow  -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/PIPE/instr_rvalid_ID_int
add wave -group "Debug_1" -color Magenta -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/PIPE/instr_rvalid_IE
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/CSR/harc_to_csr
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/regfile
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/harc_IF
add wave -group "Debug_1" -color Cyan         -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/FETCH/harc_FETCH
add wave -group "Debug_1" -color Yellow       -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/harc_ID
add wave -group "Debug_1" -color Magenta      -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/harc_EXEC
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/RF/harc_WB
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/RF/WB_EN
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/pc_IF
add wave -group "Debug_1" -color Cyan         -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/FETCH/pc_FETCH
add wave -group "Debug_1" -color Yellow       -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/pc_ID
add wave -group "Debug_1" -color Magenta      -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/pc_IE
add wave -group "Debug_1" -radix unsigned sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/RF/RS1_Addr_IE
add wave -group "Debug_1" -radix unsigned sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/RF/RS2_Addr_IE
add wave -group "Debug_1" -radix unsigned sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/RF/RD_Addr_IE
add wave -group "Debug_1" -color Cyan         -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/FETCH/instr_word_FETCH
add wave -group "Debug_1" -color Yellow       -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/instr_word_ID
add wave -group "Debug_1" -color Magenta      -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/instr_word_IE
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/RF/RS1_Data_IE
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/RF/RS2_Data_IE
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/RF/RD_Data_IE
add wave -group "Debug_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Pipe/RF/WB_RD

add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/clk_i
add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/pc_wire
add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/pc
add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/taken_branch_addr_internal
add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/PC_offset
add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/relative_to_PC
add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/incremented_pc
add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/mepc_addr_internal
add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/served_except_condition
add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/served_mret_condition
add wave -group "PC_0" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/T13_INST/Prg_Ctr/served_irq

add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/clk_i
add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/pc_wire
add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/pc
add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/taken_branch_addr_internal
add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/PC_offset
add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/relative_to_PC
add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/incremented_pc
add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/mepc_addr_internal
add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/served_except_condition
add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/served_mret_condition
add wave -group "PC_1" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/S1_INST/Prg_Ctr/served_irq

WaveRestoreCursors {0 ns}
WaveRestoreZoom    {0 ns} {200 ns}
configure wave -namecolwidth  200
configure wave -valuecolwidth 200
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -gridperiod {10 ns}
configure wave -timelineunits ns
