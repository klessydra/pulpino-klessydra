#include <stdint.h>
#include "klessydra_defs.h"

#define MHARTID_IDCORE_MASK 15
#ifndef THREAD_POOL_SIZE
	#define THREAD_POOL_SIZE 3
#endif

int barrier_completed[THREAD_POOL_SIZE]; 
int arrived_at_barrier[THREAD_POOL_SIZE];
int sync_barrier_register[THREAD_POOL_SIZE];
int key;  // key to be used for atomic operations
int *ptr_key;
int barrier_thread_registration_count;
int arrived_at_barrier_count;  // Counter for the threads that arrived at the barrier

//#ifndef __KLESSYDRACFUNCTIONS_H__
//#define __KLESSYDRACFUNCTIONS_H__

int Klessydra_get_mhartid();

int Klessydra_get_coreID();

int Klessydra_get_backup_coreID();

void mcycle_reset(void);

void minstret_reset(void);

void klessydra_lock_acquire(int *lock);

void klessydra_lock_release(int *lock);

void load_mem(int data_send, int store_addr);

int send_multi_sw_irq(int targetharts);

int send_sw_irq(int targethart);

void sync_barrier_reset();

void sync_barrier_thread_registration();

void sync_barrier();

void Klessydra_WFI();	// Wait-for-interrupt function

void Klessydra_En_Int();

__attribute__ ((always_inline)) inline void Klessydra_perf_cnt_start() 
{

	int enable_perf_cnt = 0;

    __asm__("csrrw zero, mcycle, zero;"    // reset cycle count
		"csrrw zero, minstret, zero;"  // reset instruction count
		"csrrw zero, 0xB03, zero;"     // reset load store access stall count
		"csrrw zero, 0xB06, zero;"     // reset load count
		"csrrw zero, 0xB07, zero;"     // reset store count
		"csrrw zero, 0xB08, zero;"     // reset unconditional count
		"csrrw zero, 0xB09, zero;"     // reset branch count
		"csrrw zero, 0xB0A, zero;"     // reset taken branch count
		"li %[enable], 0x000003E7;"    // enable performance counters
		"csrrw zero, 0x7A0, %[enable]" // enable performance counters
		:
		:[enable] "r" (enable_perf_cnt)
	);

}

//int* ptr_perf;

__attribute__ ((always_inline)) inline int* Klessydra_perf_cnt_finish() {	

	int perf[8] = {0};   // no need to make the array and its pointer static, as they are declared in an inline function 
	int* ptr_perf = &perf[0];

	__asm__("csrrw zero, 0x7A0, 0x00000000;" // disable performance counters
		"csrrw %[perf0], mcycle, zero;"
		"sw %[perf0], 0(%[ptr_perf]);"
		"csrrw %[perf1], minstret, zero;"
		"sw %[perf1], 4(%[ptr_perf]);"
		"csrrw %[perf2], 0xB03, zero;"
		"sw %[perf2], 8(%[ptr_perf]);"
		"csrrw %[perf3], 0xB06, zero;"
		"sw %[perf3], 12(%[ptr_perf]);"
		"csrrw %[perf4], 0xB07, zero;"
		"sw %[perf4], 16(%[ptr_perf]);"
		"csrrw %[perf5], 0xB08, zero;"
		"sw %[perf5], 20(%[ptr_perf]);"
		"csrrw %[perf6], 0xB09, zero;"
		"sw %[perf6], 24(%[ptr_perf]);"
		"csrrw %[perf7], 0xB0A, zero;"
		"sw %[perf7], 28(%[ptr_perf]);"
		:
		:[perf0] "r" (perf[0]),
		 [perf1] "r" (perf[1]),
		 [perf2] "r" (perf[2]),
		 [perf3] "r" (perf[3]),
		 [perf4] "r" (perf[4]),
		 [perf5] "r" (perf[5]),
		 [perf6] "r" (perf[6]),
		 [perf7] "r" (perf[7]),
		 [ptr_perf] "r" (ptr_perf)
		:"memory"
	);
	return ptr_perf;
}

//#endif
