#include "riscv_test.h"

#include "test_macros.h"

#include "encoding.h"

#undef  RVTEST_RV64U

#define RVTEST_RV64U RVTEST_RV32M



#define ILLEGAL_INSN_EXCEPT_CODE		  0x00000002;

#define LOAD_ERROR_EXCEPT_CODE 			  0x00000005;

#define STORE_ERROR_EXCEPT_CODE 		  0x00000007;

#define ECALL_EXCEPT_CODE 		  		  0x0000000B;

#define EXT_INTERRUPT_CODE		  		  0x8000000B;

#define SW_INTERRUPT_CODE				  0x80000003;

#define TIMER_INTERRUPT_CODE	          0x80000007;

#define LOAD_MISALIGNED_EXCEPT_CODE       0x00000004;

#define STORE_MISALIGNED_EXCEPT_CODE      0x00000006;

#define SW_INTERRUPT_CODE_NO_WFI          0x80000003;

#define SW_INTERRUPT_CODE_WFI	          0xC0000003;

#define ILLEGAL_OPERAND_EXCEPT_CODE       0x00000100;

#define ILLEGAL_BYTE_TRANSFER_EXCEPT_CODE 0x00000101;

#define ILLEGAL_ADDRESS_EXCEPT_CODE       0x00000102;

#define SCRATCHPAD_OVERFLOW_EXCEPT_CODE   0x00000103;

#define READ_SAME_SCARTCHPAD_EXCEPT_CODE  0x00000104;

#define WRITE_ACCESS_EXCEPT_CODE          0x00000105;

#define CTX_SWITCH_CODE                   0x00000110;



#define k_mstatus 	0x300

#define k_mepc 		0x341

#define k_mcause  	0x342

#define k_pcer    	0x7A0

#define k_mestatus	0x7B8

#define k_mcpuid  	0xF00

#define k_mimpid  	0xF01

#define k_mhartid 	0xF14

#define k_mirq		0xFC0

#define k_mip		0x304

#define k_mtvec		0x305



#define k_mbhartid  0xFC4

	

#ifndef HART_STACK_SIZE

  #define HART_STACK_SIZE 131072

#endif



#ifndef GLOBALRAM_ORG

  #define GLOBALRAM_ORG 0x00100000

#endif



#ifndef GLOBALRAM_SIZE

  #define GLOBALRAM_SIZE 0xEF00000

#endif



#ifndef INSTRRAM_ORG

  #define INSTRRAM_ORG 0x000000

#endif



#ifndef INSTRRAM_SIZE

  #define INSTRRAM_SIZE 0x20000

#endif



#ifndef ROM_SIZE

  #define ROM_SIZE 0x2000

#endif



#ifndef ROM_ORG

  #define ROM_ORG 0x20000

#endif



#ifndef STACK_END

#define STACK_END 0x10000000
#endif













