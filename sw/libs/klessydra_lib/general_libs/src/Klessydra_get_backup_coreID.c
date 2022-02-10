#include"functions.h"

int Klessydra_get_backup_coreID()
{

	int mhartid_value;
        int harcID;
	__asm__(
		"CSRR %0, 0xFC4;" 
		:"=r"(mhartid_value)
		:
		:
        );
        harcID = mhartid_value & MHARTID_IDCORE_MASK;	
	return harcID;
}
