#include "functions.h"

// use weak attribute here, so we can overwrite this function to provide custom exception handlers, e.g. for tests
int *stack_pointer;

__attribute__((interrupt)) __attribute__((weak))
void store_ctx_c(void)
{
	__asm__(
		"addi sp, sp, -140;"
		// as no process returns from this function, we don't need to save the return address
  		"sw x2,  0(sp);" // AAA maybe not needed as we will save the stack pointer in the globa pointer later on
  		"sw x3,  4(sp);"
  		"sw x4,  8(sp);"
  		"sw x5,  12(sp);"
  		"sw x6,  16(sp);"
  		"sw x7,  20(sp);"
  		"sw x8,  24(sp);"
  		"sw x9,  28(sp);"
  		"sw x10, 32(sp);"
  		"sw x11, 36(sp);"
  		"sw x12, 40(sp);"
  		"sw x13, 44(sp);"
  		"sw x14, 48(sp);"
  		"sw x15, 52(sp);"
  		"sw x16, 56(sp);"
  		"sw x17, 60(sp);"
  		"sw x18, 64(sp);"
  		"sw x19, 68(sp);"
  		"sw x20, 72(sp);"
  		"sw x21, 76(sp);"
  		"sw x22, 80(sp);"
  		"sw x23, 84(sp);"
  		"sw x24, 88(sp);"
  		"sw x25, 92(sp);"
  		"sw x26, 96(sp);"
  		"sw x27, 100(sp);"
  		"sw x28, 104(sp);"
  		"sw x29, 108(sp);"
  		"sw x30, 112(sp);"
  		"sw x31, 116(sp);"
  		"csrr x31, mepc;" // has the return address from the trap routine
  		"sw x31, 120(sp);"
  		"csrr x31, mstatus;" // has the interrupt enable bit that determines whether we servie WFI instructions or not
        "li x30, 0b10001000;" // create a mask to manitpulate the MPIE and MIE bits in the MSTATUS
        "xor x31, x31, x30;" // the xor will flip the bits that are 1 to 0 and the bits are 0 to 1, the other bitd are not needed
  		"sw x31, 124(sp);"
  	);

	__asm__(
  		"sw sp, 0(%[stack_pointer]);" // save the stack pointer in a global variable that will be recovered by the other core
  		"jal ra, get_sw_int_id;"      // jump to the function that determines whether we have to send a sw_irq to T13 or S1
 		"li x31, 0xFE00;"             // This creates the base address for intiating a multi software interrupt
   		"csrw 0x300, 0x8;"            // enable irq by writing to the mstatus, wfi instruction only works when irq is enabled		
 		"bltz a0, MULTI_INT;"         // if the retrun is less than zero, then the S1 core called the routing, and we have to send multiple sw interrupts
 		"SINGLE_INT:"
  		"sw %[MIP_3_Data], 0(a0);"    // wake up the hart of the other core that intiated the context switch, register 'a0' has the return value (by convention) of the get_sw_int_id function
  		"wfi;"
  		"MULTI_INT:"
  		"sw %[MIP_3_Data], 0(x31);"   // wake up the pending hart
  		"wfi;"   
  		:/*no output register*/
  		:[stack_pointer] "r" (&stack_pointer), [MIP_3_Data] "r" (8)
  	);

}

void load_ctx_c(void)
{

	// first step; load back the value of the stack pointer saved in global memory into the 'sp' register of the current core  
	__asm__(
  		"lw sp, 0(%[stack_pointer]);" // load the stack pointer from the global variable "stack_pointer"
  		:/*no output register*/
  		:[stack_pointer] "r" (&stack_pointer)
  	);

	__asm__(
		"lw x31, 124(sp);"
  		"csrrw x0, mstatus, x31;"
		"lw x31, 120(sp);"
  		"csrrw x0, mepc, x31;"
  		"lw x3,  4(sp);"
  		"lw x4,  8(sp);"
  		"lw x5,  12(sp);"
  		"lw x6,  16(sp);"
  		"lw x7,  20(sp);"
  		"lw x8,  24(sp);"
  		"lw x9,  28(sp);"
  		"lw x10, 32(sp);"
  		"lw x11, 36(sp);"
  		"lw x12, 40(sp);"
  		"lw x13, 44(sp);"
  		"lw x14, 48(sp);"
  		"lw x15, 52(sp);"
  		"lw x16, 56(sp);"
  		"lw x17, 60(sp);"
  		"lw x18, 64(sp);"
  		"lw x19, 68(sp);"
  		"lw x20, 72(sp);"
  		"lw x21, 76(sp);"
  		"lw x22, 80(sp);"
  		"lw x23, 84(sp);"
  		"lw x24, 88(sp);"
  		"lw x25, 92(sp);"
  		"lw x26, 96(sp);"
  		"lw x27, 100(sp);"
  		"lw x28, 104(sp);"
  		"lw x29, 108(sp);"
  		"lw x30, 112(sp);"
  		"lw x31, 116(sp);"
  		// the return address 'x1'is not recovered as the core loading back the context returns from a different function
  		// the previous return address is recovered by the function caller and not here by the callee
  		// load back the stack pointer in the end and reincrement the stack pointer to its original postion
   		"lw sp, 0(sp);"
   		"addi sp, sp, 140;"
  	);
}

int get_sw_int_id(void) {
	int hart_ID = Klessydra_get_backup_coreID(); // the backup hartid is the original hartid of the core
	int sw_int = 0;
	if (hart_ID < THREAD_POOL_SIZE) {
		sw_int  = 0xff00 + 4*THREAD_POOL_SIZE;
		return sw_int;
	}
	//else if (hart_ID == THREAD_POOL_SIZE) {
	//	sw_int  = 0xff00 + 4*Klessydra_get_coreID(); // the current hartid will belong to the core that initiated the context switch routine
	//}
	return -1;
}
