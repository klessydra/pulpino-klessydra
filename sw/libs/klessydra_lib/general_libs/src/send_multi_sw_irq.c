#include"functions.h"

int send_multi_sw_irq(int targetharts)
{	
	int mip_data_send = 8;  // 8 is the binary equivalent of 1000b and we need to write to '1' to the CSR register MIP(3)  
	int store_addr = 0xFE00; // base address for the multi software interrupt

	// AAA to uncomment the code below, target harts must be transformed into a number representing the hartID
	//if(targetharts >= THREAD_POOL_SIZE) { return 1;} 		// the thread to which you sent the interrupt request doesn't exist
	//else
	//{
		__asm__(
			"csrw 0xFC8, %[targetharts];"  // write the target harts into the pending interrupts register "MPIP"
			"sw %[mip_data_send], 0(%[store_addr])" // send the multiple interrupts with a store word to the MIP address at 0xFE00
			:
			: [targetharts] "r" (targetharts), 
			  [store_addr]  "r" (store_addr),
			  [mip_data_send]  "r" (mip_data_send)
		);
    //}
    return 0;
}
