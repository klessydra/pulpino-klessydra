add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/FETCH/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/DECODE/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/EXECUTE/*
add wave -group "Core" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/*
#add wave -group "SC"  -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/SCI/SC/*

add wave -group "VCU" -group "All"      -radix hexadecimal -r sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/*

add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/clk_i
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/rst_ni
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_sc_data_read
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_in_shifter_operand
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_in_shifter_operand_lat
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_in_shifter_operand_lat_wire
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_int_shifter_operand
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_out_shifter_results
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_in_cmp_operands
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_in_mul_operands_a
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_in_mul_operands_b
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_out_mul_results
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_out_cmp_results
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_in_accum_operands
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/ACCUM_STG/reduction_tree
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/ACCUM_STG/reduction_tree_wire
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_out_accum_results
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_in_adder_operands
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_in_adder_operands_lat
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_out_adder_results
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_sc_data_write_wire

add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/ACCUM_STG/reduction_tree_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/ACCUM_STG/dsp_out_accum_results_wire
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/MVSIZE_READ
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/MVSIZE_WRITE

add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/shifter_stage_1_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/shifter_stage_2_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/shifter_stage_3_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/adder_stage_1_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/adder_stage_2_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/adder_stage_3_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/mul_stage_1_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/mul_stage_2_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/mul_stage_3_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/cmp_stage_1_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/cmp_stage_2_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/accum_stage_1_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/dsp_out_accum_en
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/MSB_stage_1
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/MSB_stage_2
add wave -group "VCU" -group "Datapath" -radix hexadecimal sim:/tb/top_i/core_region_i/CORE/RISCV_CORE/ACCL_generate/VCU_inst/DSP/MSB_stage_3

add wave -group "LSU" -radix hexadecimal sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/*

add wave -group "DIV" -radix hexadecimal -R sim:tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/EXECUTE/divider_inst/*

add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/clk_i
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/nextstate_LS
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU/state_LS
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_req_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_gnt_i
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_rvalid_i
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_we_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_be_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_addr_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_wdata_o
add wave -group MEM -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/data_rdata_i

add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MCYCLE
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MINSTRET
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER3
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER6
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER7
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER8
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER9
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER10
add wave -group Perf_Cnt -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/MHPMCOUNTER22

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

add wave -group KFPU -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/KFPU_INST/*
add wave -group KFPU -group KFPU_Top -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/KFPU_INST/KFPU_INST/*
add wave -group KFPU -group FCLASS   -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/KFPU_INST/KFPU_INST/fp_classify_inst/*
add wave -group KFPU -group FADD     -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/KFPU_INST/KFPU_INST/fp_add_inst/*
add wave -group KFPU -group FMUL     -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/KFPU_INST/KFPU_INST/fp_mul_inst/*
add wave -group KFPU -group FDIV     -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/KFPU_INST/KFPU_INST/fp_div_inst/*
add wave -group KFPU -group FSqrt    -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/KFPU_INST/KFPU_INST/fp_sqrt_inst/*
add wave -group KFPU -group Normalze -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/KFPU_INST/KFPU_INST/fp_norm_inst/*
add wave -group KFPU -group Round    -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/KFPU_INST/KFPU_INST/fp_round_inst/*


add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/decoded_instruction_LS
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/decoded_instruction_DSP
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/decoded_instruction_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/irq_pending
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/set_branch_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/set_except_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/set_mret_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/set_wfi_condition
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/clk_i
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/rst_ni
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc_update_enable
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc_wire
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/instr_addr_o
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/instr_gnt_i
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/instr_rvalid_i
add wave -group Debug -color Cyan    -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/PIPE/FETCH/instr_rvalid_FETCH
add wave -group Debug -color Yellow  -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/PIPE/instr_rvalid_ID_int
add wave -group Debug -color Magenta -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/PIPE/instr_rvalid_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/CSR/harc_to_csr
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/PIPE/RF/fp_regfile
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/regfile
#add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/regfile_bram
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/harc_IF
add wave -group Debug -color Cyan         -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/FETCH/harc_FETCH
add wave -group Debug -color Yellow       -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/harc_ID
add wave -group Debug -color Magenta      -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/harc_EXEC
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/harc_WB
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_EN
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/pc_IF
add wave -group Debug -color Cyan         -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/FETCH/pc_FETCH
add wave -group Debug -color Yellow       -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/pc_ID
add wave -group Debug -color Magenta      -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/pc_IE
add wave -group Debug -radix unsigned tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS1_Addr_IE
add wave -group Debug -radix unsigned tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS2_Addr_IE
add wave -group Debug -radix unsigned tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_Addr_IE
add wave -group Debug -color Cyan         -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/FETCH/instr_word_FETCH
add wave -group Debug -color Yellow       -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/instr_word_ID
add wave -group Debug -color Magenta      -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/instr_word_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS1_Data_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RS2_Data_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/RD_Data_IE
add wave -group Debug -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RF/WB_RD

#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/S_Imm_IE
#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/I_Imm_IE
#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/SB_Imm_IE
#add wave -group Imm -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/Pipe/CSR_ADDR_IE

add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/clk_i
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc_wire
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/pc
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/taken_branch_addr_internal
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/PC_offset
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/relative_to_PC
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/incremented_pc
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/mepc_addr_internal
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/served_except_condition
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/served_mret_condition
add wave -group PC -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/served_irq

add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Prg_Ctr/clk_i
add wave -group RAW_Check -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RAW
add wave -group RAW_Check -radix decimal     tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/RAW_wire
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/EXEC_instr_lat
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/harc_EXEC_lat
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/buf_wr_ptr_lat
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/buf_wr_ptr
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rs1_chk_en
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rs2_chk_en
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rd_read_only_chk_en
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/IE_instr
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/LSU_instr
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/DSP_instr
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/EXEC_instr
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rs1_valid
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rs2_valid
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rd_read_only_valid
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rd_valid
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rs1_valid_buf
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rs2_valid_buf
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rd_read_only_valid_buf
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/rd_valid_buf
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/Instr_word_buf
add wave -group RAW_Check -radix hexadecimal tb/top_i/core_region_i/CORE/RISCV_CORE/MORPH_inst/Pipe/pc_buf

#add wave -group DMEM -radix hexadecimal sim:tb/top_i/core_region_i/mem_gen/data_mem/sp_ram_i/mem[62652400:62652416]
#add wave -group DMEM -radix hexadecimal sim:/tb/top_i/core_region_i/mem_gen/data_mem/sp_ram_i/wdata
#add wave -group DMEM -radix hexadecimal sim:/tb/top_i/core_region_i/mem_gen/data_mem/sp_ram_i/we_i
#add wave -group DMEM -radix hexadecimal sim:/tb/top_i/core_region_i/mem_gen/data_mem/sp_ram_i/wdata_i
#add wave -group DMEM -radix hexadecimal sim:/tb/top_i/core_region_i/mem_gen.data_mem/sp_ram_i/addr_i


WaveRestoreCursors {0 ns}
WaveRestoreZoom    {0 ns} {200 ns}
configure wave -namecolwidth  200
configure wave -valuecolwidth 200
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -gridperiod {10 ns}
configure wave -timelineunits ns
