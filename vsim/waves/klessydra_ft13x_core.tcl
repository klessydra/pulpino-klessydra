add wave -group "Core" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/FETCH/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/DECODE/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/EXECUTE/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/*
#add wave -group "Core" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/ACCL_generate/DSP/*
#add wave -group "DSP" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/ACCL_generate/DSP/*
#add wave -group "LSU" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/*
#add wave -group "SC"  -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/ACCL_generate/SCI/*
#add wave -group "SC"  -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/SCI/SC/*

add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/clk_i
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/nextstate_LS
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/state_LS
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/data_req_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/data_gnt_i
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/data_rvalid_i
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/store_valid 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/load_valid 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/data_rdata_i
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/data_we_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/data_be_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/data_addr_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/data_wdata_o
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/core_busy_LS_wires 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/core_busy_LS_buf_wire 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/core_busy_LS_buf 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/busy_LS_wires 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/busy_LS_buf_wire 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/busy_LS_buf 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/data_be_internal_buf 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/data_addr_internal_buf
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/data_wdata_o_buf 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/data_we_o_buf_wire
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/data_we_o_buf
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/data_req_o_buf_wire
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/data_req_o_buf
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/store_op_buf_wire
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/store_op_buf
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/ls_instr_req_buf_wire
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/ls_instr_req_buf
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/ls_instr_req_buf_prova;
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/load_op_buf_wire 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/load_op_buf 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/mem_gen/data_mem/sp_ram_i/mem
#add wave -group MEM -radix hexadecimal -position insertpoint /tb/top_i/core_region_i/mem_gen/data_mem/sp_ram_i/mem

#add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MCYCLE
#add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MINSTRET
#add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MHPMCOUNTER3
#add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MHPMCOUNTER6
#add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MHPMCOUNTER7
#add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MHPMCOUNTER8
#add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MHPMCOUNTER9
#add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MHPMCOUNTER10

#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MTVEC
#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/PCER
#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MSTATUS
#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MESTATUS
#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MCAUSE
#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MEPC
#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MIP
#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MIRQ
#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MHARTID
#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MVTYPE
#add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/MVSIZE

add wave -group Debug -radix hexadecimal tb/tb_sv2uvm_if/fault 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/decoded_instruction_LS
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/decoded_instruction_DSP
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/decoded_instruction_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/irq_pending
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/set_branch_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/set_except_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/set_mret_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/set_wfi_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/clk_i
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/rst_ni
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/pc_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/pc
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/pc_voted_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/fault_PC 
#add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/fault_LSU 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/instr_addr_o
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/instr_gnt_i
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/instr_rvalid_i
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/CSR/harc_to_csr
#add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/fault_RF
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/regfile_voted_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/regfile
#add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/regfile_bram
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/harc_IF
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/harc_ID
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/harc_EXEC
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/harc_WB
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/harc_LS_WB 

add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/harc_LS_count 
#add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/ls_counter_on 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LS_PE_WB_EN 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LS_WB_EN 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/busy_ID 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/EXECUTE/core_busy_IE 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/core_busy_LS 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/core_busy_WB 


add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/WB_EN
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/WB_EN_buf_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/WB_EN_buf 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/pc_update_enable 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/PC_offset 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/pc_IF
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/pc_ID
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/pc_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/fault_harc 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/harc_loss 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/clk_i
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/harc_IF
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/harc_ID
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/harc_EXEC
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/no_exec_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/no_exec 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/harc_fault_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/harc_fault 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/harc_fault_wire_lat 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/harc_WB
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/pc_IE
#add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/LS_peripheral 
#add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LSU/LS_peripheral_counter 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/RS1_Addr_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/RS2_Addr_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/RD_Addr_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/FETCH/instr_word_ID_lat 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/FETCH/instr_word_ID 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/DECODE/instr_word_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/instr_word_WB 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/RS1_Data_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/RS2_Data_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/RD_Data_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/DECODE/dest_valid 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/rs1_bypass
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/rs2_bypass 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/WB_wrong
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/LS_WB_wrong 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/RD_dummy_buf 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/RD_dummy_wire  
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/WB_RD
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/WB_RD_buf_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/RF/WB_RD_voted_wire 

#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/S_Imm_IE
#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/I_Imm_IE
#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/SB_Imm_IE
#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/CSR_ADDR_IE

#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/clk_i
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/taken_branch_pc_lat
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/PC_offset
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/relative_to_PC
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/incremented_pc
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/mepc_incremented_pc
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/mepc_interrupt_pc
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/boot_pc
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/pc
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/served_except_condition
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/served_mret_condition
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/served_irq
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Prg_Ctr/pc_IF
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/FETCH/pc_ID
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/pc_IE

add wave -group RAM -radix hexadecimal /tb/top_i/core_region_i/mem_gen/data_mem/sp_ram_i/*

#add wave -group UART -radix hexadecimal /tb/top_i/peripherals_i/apb_uart_i/*
#add wave -group tutto  -radix hexadecimal sim:tb/*
#add wave -group tutto  -radix hexadecimal sim:tb/top_i/*
#add wave -group periferiche  -radix hexadecimal tb/top_i/peripherals_i/apb_timer_i/*
#add wave -group TIMER -r {sim:/tb/top_i/peripherals_i/apb_timer_i/TIMER_GEN[0]/*}
#add wave -group TIMER -r {sim:/tb/top_i/peripherals_i/apb_timer_i/TIMER_GEN[1]/*}
configure wave -namecolwidth  250
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -timelineunits ns
