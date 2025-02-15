add wave -group "Core" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/FETCH/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/DECODE/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/EXECUTE/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/*
#add wave -group "Core" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/ACCL_generate/DSP/*
#add wave -group "DSP" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/ACCL_generate/DSP/*
add wave -group "LSU" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/*
#add wave -group "SC"  -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/ACCL_generate/SCI/*
#add wave -group "SC"  -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/SCI/SC/*


add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/clk_i
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/nextstate_LS
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/state_LS
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_req_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_gnt_i
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_rvalid_i
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/store_valid 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/load_valid 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_rdata_i
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_we_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_be_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_addr_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_wdata_o
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/core_busy_LS_wires 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/core_busy_LS_buf_wire 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/core_busy_LS_buf 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/busy_LS_wires 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/busy_LS_buf_wire 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/busy_LS_buf 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_addr_internal_buf_wire
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_wdata_o_buf_wire
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_we_o_buf_wire 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_req_o_buf_wire 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_be_internal_buf_wire 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_width_ID_buf_wire 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/decoded_instruction_LS_buf_wire 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/decoded_instruction_LS_voted_wire 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/decoded_instruction_LS_voted 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_be_internal_buf 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_addr_internal_buf
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_wdata_o_buf 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_we_o_buf_wire
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_we_o_buf
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_req_o_buf_wire
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/data_req_o_buf
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/store_op_buf_wire
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/store_op_buf
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/ls_instr_req_buf_wire
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/ls_instr_req_buf
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/ls_instr_req_buf_prova;
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/load_op_buf_wire 
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/load_op_buf 
#add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/mem_gen/data_mem/sp_ram_i/mem
#add wave -group MEM -radix hexadecimal -position insertpoint /tb/top_i/core_region_i/mem_gen/data_mem/sp_ram_i/mem

add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MCYCLE
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MINSTRET
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER3
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER6
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER7
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER8
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER9
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER10

add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MTVEC
add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/PCER
add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MSTATUS
add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MESTATUS
add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MCAUSE
add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MEPC
add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MIP
add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MIRQ
add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHARTID
add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MVTYPE
add wave -group CSR -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MVSIZE

#add wave -group Debug -radix hexadecimal tb/tb_sv2uvm_if/cb/fault 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/decoded_instruction_LS
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/decoded_instruction_DSP
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/decoded_instruction_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/irq_pending
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/set_branch_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/set_except_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/set_mret_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/set_wfi_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/clk_i
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/rst_ni
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/harc_sleep_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/harc_sleep 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc_wire
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/restore_fault 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/LS_is_running 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/LS_is_running_wire
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/restore_store_active 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/restore_fault_LSU 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/restore_fault_LSU_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/restore_fault_RF 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/restore_fault_RF_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/restore_fault_WB 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/restore_fault_PC
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/restore_fault_PC_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_done_wire
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_done
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/WB_no_done 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/instr_addr_o
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/instr_gnt_i
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/instr_rvalid_i
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/harc_to_csr
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_voted_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/regfile
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/busy_ID 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/EXECUTE/core_busy_IE 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/core_busy_LS 
#add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/core_busy_WB 
#add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/regfile_bram
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/harc_IF
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/harc_ID
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/harc_EXEC
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/harc_WB
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_EN
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_EN_buf_wire
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_EN_buf
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc_update_enable 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/PC_offset 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc_voted_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc_voted 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc_voted_lat
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc_voted_lat_lat
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/pc_IF
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/pc_ID
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/pc_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS1_Addr_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS2_Addr_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_Addr_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/DECODE/dest_valid 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_WB_buf_wire
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_WB 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_done_PC 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/FETCH/instr_word_ID
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/FETCH/instr_word_ID_lat 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/DECODE/instr_word_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS1_Data_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS2_Data_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_Data_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/DECODE/bypass_rs1 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/DECODE/bypass_rs2 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/rs1_bypass_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/rs2_bypass_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/LS_WB_wrong_EXEC 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_RD
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_RD_buf_wire 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_RD_buf 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_RD_voted 
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_RD_voted_wire 

#add wave -group ECC -radix hexadecimal tb/tb_sv2uvm_if/cb/fault 
add wave -group ECC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/clk_i
add wave -group ECC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/rst_ni
add wave -group ECC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/regfile
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_done_PC 
#add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/ECC_signature_wire 

add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RS1_operand 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RS1_operand_buffer_wire 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RS1_operand_buffer 
#add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RS1_ECC_operand 
#add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RS1_ECC_operand_wire 

add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS1_corrected_error 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS1_corrected_error_buffer_wire 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS1_corrected_error_buffer 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS1_uncorrectable_error 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS1_erroneous_parity_bit 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RS2_operand 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RS2_operand_buffer_wire 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RS2_operand_buffer 
#add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RS2_ECC_operand 
#add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RS2_ECC_operand_wire 

add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS2_corrected_error 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS2_corrected_error_buffer_wire 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS2_corrected_error_buffer 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS2_uncorrectable_error 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS2_erroneous_parity_bit 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/regfile_RD_operand 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_corrected_error 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_uncorrectable_error 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_erroneous_parity_bit 

add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_EXEC 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_different 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_WB_buffer_wire 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_WB_buffer 
#add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_corrected 
#add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_WB_buffer_en 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_RD_corrected_wire 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_RD_voted_wire 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_RD_final 
add wave -group ECC -radix hexadecimal  tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_RD_ECC_voted_wire 

add wave -r sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/secded_decoder_rs1/*

add wave -r sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/secded_encoders/*

#add wave -r sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/secded_collector_rs1/*

#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/S_Imm_IE
#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/I_Imm_IE
#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/SB_Imm_IE
#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/CSR_ADDR_IE

add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/clk_i
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/taken_branch_addr_internal
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/PC_offset
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/relative_to_PC
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/incremented_pc
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/mepc_incremented_pc
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/mepc_interrupt_pc
#add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/boot_pc
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/served_except_condition
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/served_mret_condition
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/served_irq
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc_IF
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/FETCH/pc_ID
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/pc_IE

add wave -group tutto  -radix hexadecimal sim:tb/*
add wave -group tutto  -radix hexadecimal sim:tb/top_i/*
add wave -group periferiche  -radix hexadecimal sim:tb/top_i/peripherals_i/apb_timer_i/*
add wave -group TIMER0 -r {sim:/tb/top_i/peripherals_i/apb_timer_i/TIMER_GEN[0]/*}
add wave -group TIMER1 -r {sim:/tb/top_i/peripherals_i/apb_timer_i/TIMER_GEN[1]/*}



configure wave -namecolwidth  250
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -timelineunits ns
