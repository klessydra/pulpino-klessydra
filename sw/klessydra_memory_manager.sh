#---------------------------------------------------------------------
####################################################################################################################
#  ██╗░░██╗██╗░░░░░███████╗░██████╗░██████╗██╗░░░██╗██████╗░██████╗░░█████╗░
#  ██║░██╔╝██║░░░░░██╔════╝██╔════╝██╔════╝╚██╗░██╔╝██╔══██╗██╔══██╗██╔══██╗
#  █████═╝░██║░░░░░█████╗░░╚█████╗░╚█████╗░░╚████╔╝░██║░░██║██████╔╝███████║
#  ██╔═██╗░██║░░░░░██╔══╝░░░╚═══██╗░╚═══██╗░░╚██╔╝░░██║░░██║██╔══██╗██╔══██║
#  ██║░╚██╗███████╗███████╗██████╔╝██████╔╝░░░██║░░░██████╔╝██║░░██║██║░░██║
#  ╚═╝░░╚═╝╚══════╝╚══════╝╚═════╝░╚═════╝░░░░╚═╝░░░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝
#  ███╗░░░███╗███████╗███╗░░░███╗░█████╗░██████╗░██╗░░░██╗		███╗░░░███╗░█████╗░███╗░░██╗░█████╗░░██████╗░███████╗██████╗░
#  ████╗░████║██╔════╝████╗░████║██╔══██╗██╔══██╗╚██╗░██╔╝		████╗░████║██╔══██╗████╗░██║██╔══██╗██╔════╝░██╔════╝██╔══██╗
#  ██╔████╔██║█████╗░░██╔████╔██║██║░░██║██████╔╝░╚████╔╝░		██╔████╔██║███████║██╔██╗██║███████║██║░░██╗░█████╗░░██████╔╝
#  ██║╚██╔╝██║██╔══╝░░██║╚██╔╝██║██║░░██║██╔══██╗░░╚██╔╝░░		██║╚██╔╝██║██╔══██║██║╚████║██╔══██║██║░░╚██╗██╔══╝░░██╔══██╗
#  ██║░╚═╝░██║███████╗██║░╚═╝░██║╚█████╔╝██║░░██║░░░██║░░░		██║░╚═╝░██║██║░░██║██║░╚███║██║░░██║╚██████╔╝███████╗██║░░██║
#  ╚═╝░░░░░╚═╝╚══════╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░		╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚═╝░╚═════╝░╚══════╝╚═╝░░╚═╝
####################################################################################################################
# Version: 2.0, 25/05/2023
# Marco Angioli, Sapienza University of Rome

#!/bin/bash

align_to_32bit_word_exc() {
    address=$1  # Hex address as the function argument

    # Convert hex address to decimal
    decimal_address=$(( 16#$address ))
	
    # Check if the decimal address is divisible by 4
    if (( decimal_address % 4 != 0 )); then
        # Calculate the aligned address
        aligned_address=$(( (decimal_address & ~3) + 4 ))
        echo -e "\e[33mWarning:\e[39mThe address was not aligned. Automatically aligned to the subsequent address: 0x$(printf "%X" "$aligned_address")">&2
		aligned_address=$(echo "obase=16;${aligned_address}" | bc)
		echo $aligned_address
	else
		echo $address
    fi
	
}


align_to_32bit_word_def() {
    address=$1  # Hex address as the function argument

    # Convert hex address to decimal
    decimal_address=$(( 16#$address ))
	
    # Check if the decimal address is divisible by 4
    if (( decimal_address % 4 != 0 )); then
        # Calculate the aligned address
        aligned_address=$(( (decimal_address & ~3) - 4 ))
        echo -e "\e[33mWarning:\e[39m The address was not aligned. Automatically aligned to the previous address: 0x$(printf "%X" "$aligned_address")">&2
		aligned_address=$(echo "obase=16;${aligned_address}" | bc)
		echo $aligned_address
	else
		echo $address
    fi
	
}

echo -e "\e[93m---------------------------------------\e[39m"
echo -e "\e[93m\e[1m    Klessydra Memory Manager (KMM) \e[1m\e[39m"
echo -e "\e[93m\e[1m     	     v. 1.0          	   \e[0m\e[39m"
echo -e "\e[93m---------------------------------------\e[39m"



# Path to the configuration file
CONFIG_FILE="$HOME/.klessydra_memory_manager_rc"

# Check if the configuration file exists
if [[ -f "$CONFIG_FILE" ]]; then
    # Configuration file exists, so the program has been opened before
    echo "Welcome back to Klessydra_Memory_Manager!"
    source "$CONFIG_FILE"
else
    # Configuration file doesn't exist, so this is the first time the program is opened
    echo "Welcome to Klessydra_Memory_Manager! This is the first time you've opened this program."
    echo "Please, enter the path to the pulpino-klessydra directory: (e.g. /home/user/pulpino-klessydra)"
    read -r PULPINO_DIR
    echo "PULPINO_DIR=$PULPINO_DIR" > "$CONFIG_FILE"
    # Create the configuration file and set the flag to indicate that the program has been opened before
    touch "$CONFIG_FILE"
    echo "program_opened=true" >> "$CONFIG_FILE"
fi

# File Paths
LINK_COMMON=$PULPINO_DIR/sw/ref/link.common.ld
LINK_BOOT=$PULPINO_DIR/sw/ref/link.boot.ld
CORE_REGION=$PULPINO_DIR/rtl/core_region.sv
INSTR_RAM_WRAP=$PULPINO_DIR/rtl/instr_ram_wrap.sv
SP_RAM_WRAP=$PULPINO_DIR/rtl/sp_ram_wrap.sv
S19_TO_BOOT=$PULPINO_DIR/sw/utils/s19toboot.py
S19_TO_SLM=$PULPINO_DIR/sw/utils/s19toslm.py
DSP_FUNCTIONS=$PULPINO_DIR/sw/libs/klessydra_lib/dsp_libs/inc/dsp_functions.h
KLESSYDRA_DEFS=$PULPINO_DIR/sw/libs/klessydra_lib/general_libs/inc/klessydra_defs.h
CRT0_KLESSYDRA=$PULPINO_DIR/sw/ref/crt0.klessydra.S

#---------------------------------------------------------------------
# Script Header
valid=false
while ! $valid; do
    echo "Specified pulpino-klessydra directory: $PULPINO_DIR"
    echo "What do you want to do?"
    echo "- 1: View a detailed overview of the actual memory"
    echo "- 2: Change one memory region's size"
	echo "- 3: Change the memory starting addresses"
	echo "- 4: Change all the memory regions settings"
	echo "- 5: Reset memory regions to the default configuration"
	echo "- 6: Change the ScratchPad Memories (SPMs) size"
    echo "- 7: Change Pulpino directory"
	echo "- 8: Exit"
    read -r option
    echo -e "\e[93m-----------------------------------\e[39m"
 
    if ! (( option == 1 || option == 2 || option == 3 || option == 4 || option == 5 || option == 6 || option == 7 ||option==8)); then
        echo -e "\e[91mError:\e[39m Not a valid option, please try again.\n"
    else
        valid=true
    fi
done

# Reading the actual memory starting addresses and sizes
# Starting addresses, in hex
actual_instrram_origin_h=$(cat $LINK_COMMON | grep -n "instrram" | head -1 | cut -d ":" -f 3 | awk '{print $3}' | sed 's/.$//' |tr -d "[:blank:]"|awk '{print substr($0,3)}')  	# INSTRRAM starting address in hex
actual_rom_origin_h=$(cat $LINK_BOOT| grep -n "rom" | head -1 | cut -d ":" -f 3 | awk '{print $3}' |tr -d "[:blank:]"|awk '{print substr($0,3)}'| sed 's/.$//' )				# ROM starting address in hex
actual_data_ram_origin_h=$(cat $LINK_COMMON | grep -n "dataram" | head -1 | cut -d ":" -f 3 | awk '{print $3}' |tr -d "[:blank:]"|awk '{print substr($0,3)}'|sed 's/.$//')     	# DATA_RAM starting address in hex
actual_stack_origin_h=$(cat $LINK_COMMON | grep -n "stack" | head -1 | cut -d ":" -f 3 | awk '{print $3}' |tr -d "[:blank:]"|awk '{print substr($0,3)}'|sed 's/.$//')           # STACK starting address in hex
actual_l2_origin_h=$(cat $S19_TO_SLM|grep "l2_start"|head -n 1|cut -d "=" -f 2|tr -d "[:blank:]"|awk '{print substr($0,3)}')
# Starting addresses in decimal
actual_instrram_origin=$(( 16#$actual_instrram_origin_h ))          # INSTRRAM starting address in decimal
actual_rom_origin=$(( 16#$actual_rom_origin_h ))                    # ROM starting address in decimal
actual_data_ram_origin=$(( 16#$actual_data_ram_origin_h ))          # DATA_RAM starting address in decimal
actual_stack_origin=$(( 16#$actual_stack_origin_h ))                # STACK starting address in decimal

# Sizes in hex
actual_instrram_size_h=$(cat $LINK_COMMON| grep -n "instrram" | head -1 | cut -d ":" -f 3|cut -d "=" -f 3 |tr -d "[:blank:]"|awk '{print substr($0,3)}') 	    # INSTRRAM SIZE in hex
actual_rom_size_h=$(cat $LINK_BOOT | grep -n "rom" | head -1 | cut -d ":" -f 3 | awk '{print $6}'|tr -d "[:blank:]"|awk '{print substr($0,3)}')					# ROM SIZE in hex
actual_data_ram_size_h=$(cat $LINK_COMMON | grep -n "dataram" | head -1 | cut -d ":" -f 3 | awk '{print $6}' |tr -d "[:blank:]"|awk '{print substr($0,3)}') 	# DATA_RAM SIZE in hex
actual_stack_size_h=$(cat $LINK_COMMON | grep -n "stack" | head -1 | cut -d ":" -f 3 | awk '{print $6}' |tr -d "[:blank:]"|awk '{print substr($0,3)}')          # STACK SIZE in hex

# Sizes in decimal
actual_instrram_size=$(( 16#$actual_instrram_size_h ))			# INSTRRAM size in decimal
actual_rom_size=$(( 16#${actual_rom_size_h} ))					# ROM size in decimal
actual_data_ram_size=$(( 16#${actual_data_ram_size_h} )) 		# DATA_RAM size in decimal
actual_stack_size=$(( 16#${actual_stack_size_h} ))              # STACK size in decimal
slm_actual_instrram_size=$(cat $S19_TO_SLM  | grep -n "l2_bank_size" | head -1 | cut -d ":" -f 2-| cut -d "=" -f 2|cut -d "#" -f 1 |tr -d "[:blank:]")			# INSTRRAM size in decimal
actual_size_per_stack=$(cat $KLESSYDRA_DEFS | grep "thread_stack_size"|cut -d " " -f 3|tr -d "[:blank:]")			# STACK size per threadin decimal

actual_total_data_ram_size=$(( actual_data_ram_size + actual_stack_size )) # DATA_RAM + STACK size in decimal
actual_total_data_ram_size_h=$(echo "obase=16; $actual_total_data_ram_size" | bc) # DATA_RAM + STACK size in hex

clear
echo -e "\e[93m-----------------------------------\e[39m"
echo -e "\e[93mKLESSYDRA MEMORY OVERVIEW \e[39m"
echo -e " \e[4mActual Memory Starting Addresses\e[0m--->"
echo "  - INSTRRAM origin: 0x$actual_instrram_origin_h"
echo "  - ROM origin: 0x$actual_rom_origin_h"
echo "  - DATARAM origin: 0x$actual_data_ram_origin_h"
echo "  - STACK origin: 0x$actual_stack_origin_h"
echo -e " \e[4mActual Memory Sizes\e[0m--->"
echo "  - INSTRRAM size: 0x$actual_instrram_size_h"
echo "  - ROM size: 0x$actual_rom_size_h"
echo "  - DATARAM size: 0x$actual_data_ram_size_h"
echo "  - STACK size: 0x$actual_stack_size_h"
echo -e "\e[93m-----------------------------------\e[39m"

if (($option==1)) #
then
	# Actual Memory Size print -->
    echo -e "\e[93mFILES ACTUALLY HANDLED BY KMM \e[39m"
	echo -e "List of file that Klessydra Memory Manager actually handles:\n"
	echo -e "- LINK_COMMON = $LINK_COMMON"
	echo -e "- LINK_BOOT = $LINK_BOOT"
	echo -e "- CORE_REGION = $CORE_REGION"
	echo -e "- INSTR_RAM_WRAP = $INSTR_RAM_WRAP"
	echo -e "- SP_RAM_WRAP = $SP_RAM_WRAP"
	echo -e "- S19_TO_BOOT = $S19_TO_BOOT"
	echo -e "- S19_TO_SLM = $S19_TO_SLM"
	echo -e "- DSP_FUNCTIONS = $DSP_FUNCTIONS"
	echo -e "- KLESSYDRA_DEFS = $KLESSYDRA_DEFS"
	echo -e "- CRT0_KLESSYDRA = $CRT0_KLESSYDRA"
	echo -e "\e[93m-----------------------------------\e[39m"
	echo -e "\e[93mDETAILED MEMORY DESCRIPTION \e[39m"
    echo -e "This section shows the memory size and starting address of each memory in the system."
    echo -e "It also reports all the files containing where the memory size and starting address are defined.\n"
	# INSTR_RAM:
	echo -e "\e[4m\e[1mINSTRRAM->\e[0m"
	echo -e "In file \e[36m$LINK_COMMON ->\e[39m"
	cat $LINK_COMMON | grep -n "instrram"      | head -1| cut -d ":" -f 3|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$CORE_REGION ->\e[39m"
	cat $CORE_REGION    | grep -n "INSTR_RAM_SIZE"| head -1 | cut -d ":" -f 2- |tr "parameter" " "|cut -d ',' -f 1|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$INSTR_RAM_WRAP ->\e[39m"
	cat $INSTR_RAM_WRAP | grep -n "RAM_SIZE"      | head -1 | cut -d ":" -f 2- |tr "parameter" " "|cut -d ',' -f 1|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$S19_TO_SLM ->\e[39m"
	cat $S19_TO_SLM | grep -n "l2_bank_size"      | head -1 | cut -d ":" -f 2-
	cat $S19_TO_SLM | grep -n "l2_start"      | head -1 | cut -d ":" -f 2-
	

	# ROM:
	echo -e "\n\e[4m\e[1mROM->\e[0m"
	echo -e "In file \e[36m$LINK_BOOT ->\e[39m"
	cat $LINK_BOOT   | grep -n "rom"      | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$S19_TO_BOOT ->\e[39m"
	cat $S19_TO_BOOT | grep -n "rom_start"| head -1 | cut -d ":" -f 2-|tr -d "[:blank:]"
	cat $S19_TO_BOOT | grep -n "rom_size" | head -1 | cut -d ":" -f 2-|tr -d "[:blank:]"|cut -d "#" -f 1|tr "\n" " "; echo  -e " --> space allocated for the \e[4mboot program\e[0m.\nIt can not be automatically changed in this version of Klessydra Manager "



	# DATARAM:
	echo -e "\n\e[4m\e[1mDATARAM->\e[0m"
	echo -e "In file \e[36m$LINK_COMMON ->\e[39m"
	cat $LINK_COMMON | grep -n "dataram"       | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$CORE_REGION ->\e[39m"
	cat $CORE_REGION    | grep -n "DATA_RAM_SIZE" | head -1 | cut -d ":" -f 2- |tr "parameter" " "|cut -d ',' -f 1|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$SP_RAM_WRAP ->\e[39m"
	cat $SP_RAM_WRAP    | grep -n "RAM_SIZE"      | head -1 | cut -d ":" -f 2- |tr "parameter" " "|cut -d ',' -f 1|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$S19_TO_SLM ->\e[39m"
	cat $S19_TO_SLM | grep -n "tcdm_bank_size"      | head -1 | cut -d ":" -f 2-
	cat $S19_TO_SLM | grep -n "tcdm_origin"      | head -1 | cut -d ":" -f 2-

	# STACK:
	echo -e "\n\e[4m\e[1mSTACK->\e[0m"
	echo -e "In file \e[36m$LINK_BOOT ->\e[39m"
	cat $LINK_BOOT   | grep -n "stack"| head -1| cut -d ":" -f 3|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$LINK_COMMON ->\e[39m"
	cat $LINK_COMMON | grep -n "stack"| head -1| cut -d ":" -f 3|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$KLESSYDRA_DEFS ->\e[39m"
	cat $KLESSYDRA_DEFS | grep "thread_stack_size"

elif (($option==2))
then

	valid_mem=false

	while ! $valid_mem; do
	    echo "What do you want to change?"
	    echo -e "1) INSTRRAM size\n2) ROM size\n3) DATARAM size\n4) STACK size"
	    read -r required_memory

	    if ! (( required_memory >= 1 && required_memory <= 4 )); then
	        echo -e "\e[91mError:\e[39m Not a valid option, please try again.\n"
	    else
	        valid_mem=true
	    fi
	done

	echo -e "\e[93m-----------------------------------\e[39m"

	case $required_memory in

		# INSTR_RAM
		1)
			clear
			echo -e "\e[93mModifying INSTR_RAM memory ->\e[39m"			

			# Debug info
			echo "INSTR_RAM starting address: 0x$actual_instrram_origin_h"
			echo "INSTR_RAM size: 0x$actual_instrram_size_h, that are $actual_instrram_size bytes"
			
			# Reading new size and converting it
			echo -n "New desired size (start with 0x to specify an hexadecimal number): "
			read new_size_input

			if [[ $new_size_input == 0x* ]]
			then
				# Convert hexadecimal input to decimal
				new_size_h=${new_size_input#0x}
				new_size=$(( 16#${new_size_h} ))
			else
				# Convert decimal input to hexadecimal
				new_size=${new_size_input}
				new_size_h=$(echo "obase=16;${new_size}" | bc)
			fi
			
			# Check the requested value with the subsequent memory region (ROM)				
			echo "Inserted size: 0x$new_size_h ($new_size Bytes), the ROM start at: 0x$actual_rom_origin_h"
			echo -e "\e[93m-----------------------------------\e[39m"

			# Check if the new size overlaps the subsequent memory region
			if ((actual_instrram_origin + new_size > actual_rom_origin)); then
				read -p $'\e[91mWarning: \e[39mthe required space overlaps the subsequent memory region (ROM)... do you want to update all the memory? (y or n) ' answer
				if [[ $answer == [Nn] ]]; then
					exit
				fi		
				
				echo  -e "\e[93mList of Updated Memory regions:\e[39m"
				# Update the ROM memory starting address, accordingly to the new INSTR_RAM size
				new_rom_origin=$((actual_instrram_origin+new_size))
				new_rom_origin_h=$(echo "obase=16;${new_rom_origin}" |bc)
				new_rom_origin_h=$(align_to_32bit_word_exc "$new_rom_origin_h")
		 
				sed -i -e "s/\(rom\s*:\s*ORIGIN\s*=\s*\)0x$actual_rom_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_rom_size_h*/\10x$new_rom_origin_h\2 0x$actual_rom_size_h/g" $LINK_BOOT		
				sed -i -e "s/\(\s*rom_start\s*=\s*\)0x$actual_rom_origin_h\b/\10x$new_rom_origin_h/g" $S19_TO_BOOT
				echo -ne "ROM ---> in files link.boot.ld and s19toboot.py. ";cat $LINK_BOOT | grep -n "rom" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
                
							
				# Check if the new ROM position overlaps the subsequent memory region
				if (($new_rom_origin+$actual_rom_size > $actual_data_ram_origin))
				then
					# Update the DATA_RAM memory starting address, accordingly to the new ROM position
					new_data_ram_origin=$((new_rom_origin+new_size))
					new_data_ram_origin_h=$(echo "obase=16;${new_data_ram_origin_h}" |bc)
					new_data_ram_origin_h=$(align_to_32bit_word_exc "$new_data_ram_origin_h")
					sed -i -e "s/\(dataram\s*:\s*ORIGIN\s*=\s*\)0x$actual_data_ram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_data_ram_size_h*/\10x$new_data_ram_origin_h\20x$actual_data_ram_size_h/g" $LINK_COMMON
                    sed -i -e "s/\(\s*tcdm_start\s*=\s*\)0x$actual_data_ram_origin_h\b/\10x$new_data_ram_origin_h/g" $S19_TO_SLM

					# Print the new DATA_RAM starting address
                    echo -ne "DATA_RAM ---> in file link.common.ld and s19toslm.py ";cat $LINK_COMMON | grep -n "dataram" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
								

					# Update the stack position
					new_stack_origin=$((new_data_ram_origin+actual_data_ram_size))
					new_stack_origin_h=$(echo "obase=16;${new_stack_origin}" |bc)
					new_stack_origin_h=$(align_to_32bit_word_exc "$new_stack_origin_h")

					# Update the stack position in the linker scripts
                    sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_COMMON
                    sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_BOOT	

					# Print the new stack position 				
                    echo -ne "STACK ---> in files link.boot.ld and link.common.ld. ";cat $LINK_COMMON | grep -n "stack" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"	
				fi
			else
				echo  -e "\e[93mList of Updated Memory regions:\e[39m"
			fi

			
			slm_new_size=$((new_size/4))
			# Update the INSTR_RAM size in the linker script, the core_region.sv, the instr_ram_wrap.sv and s19toslm.py
			sed -i -e "s/\(instrram\s*:\s*ORIGIN\s*=\s*\)0x$actual_instrram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_instrram_size_h*/\10x$actual_instrram_origin_h\20x$new_size_h/g" $LINK_COMMON
            sed -i -e "s/\(\s*INSTR_RAM_SIZE\s*=\s*\)$actual_instrram_size\b/\1$new_size/g" $CORE_REGION
            sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_instrram_size\b/\1$new_size/g" $INSTR_RAM_WRAP
			sed -i -e "s/\(\s*l2_bank_size\s*=\s*\)$slm_actual_instrram_size\b/\1$slm_new_size/g" $S19_TO_SLM
			
			echo -ne "INSTRRAM UPDATED ---> in files: link.common.ld, core_region.sv, s19toslm.py, instr_ram_wrap.sv. ";cat $LINK_COMMON | grep -n "instrram" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
			;;
			
		2)
			clear
			echo -e "\e[93mModifying ROM memory ->\e[39m"

			# Debug info
			echo "ROM starting address: 0x$actual_rom_origin_h"
			echo "ROM size: 0x$actual_rom_size_h, that are $actual_rom_size bytes"
			
			# Reading new size and converting it
			echo -n "New desired size (start with 0x to specify an hexadecimal number): "
			read new_size_input

			if [[ $new_size_input == 0x* ]]
			then
				# Convert hexadecimal input to decimal
				new_size_h=${new_size_input#0x}
				new_size=$((16#${new_size_h}))
			else
				# Convert decimal input to hexadecimal
				new_size=${new_size_input}
				new_size_h=$(echo "obase=16;${new_size}" | bc)
			fi
			
			# Check the requested value with the subsequent memory region (DATA_RAM)				
			echo "Inserted size: 0x$new_size_h ($new_size Bytes), the DATA_RAM start at: 0x$actual_data_ram_origin_h"
			echo -e "\e[93m-----------------------------------\e[39m"
            
			# Check if the new size overlaps the subsequent memory region
			if ((actual_rom_origin + new_size > actual_data_ram_origin)); then
				read -p $'\e[91mWarning: \e[39mthe required space overlaps the subsequent memory region (DATA_RAM)... do you want to update all the memory? (y or n) ' answer
				if [[ $answer == [Nn] ]]; then
					exit
				fi						
				echo  -e "\e[93mList of Updated Memory regions:\e[39m"

				# Update the DATA_RAM memory starting address, accordingly to the new ROM size
				new_data_ram_origin=$((actual_rom_origin+new_size))
				new_data_ram_origin_h=$(echo "obase=16;${new_data_ram_origin}" |bc)
				new_data_ram_origin_h=$(align_to_32bit_word_exc "$new_data_ram_origin_h")
				new_data_ram_origin=$((16#${new_data_ram_origin_h}))

				sed -i -e "s/\(dataram\s*:\s*ORIGIN\s*=\s*\)0x$actual_data_ram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_data_ram_size_h*/\10x$new_data_ram_origin_h\20x$actual_data_ram_size_h/g" $LINK_COMMON
               	sed -i -e "s/\(\s*tcdm_start\s*=\s*\)0x$actual_data_ram_origin_h\b/\10x$new_data_ram_origin_h/g" $S19_TO_SLM
			    echo -ne "DATA_RAM ---> in file link.common.ld and s19toslm.py ";cat $LINK_COMMON | grep -n "dataram" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
																	
				# Update the stack position
				new_stack_origin=$((new_data_ram_origin+actual_data_ram_size))
				new_stack_origin_h=$(echo "obase=16;${new_stack_origin}" |bc)
				new_stack_origin_h=$(align_to_32bit_word_exc "$new_stack_origin_h")

				# Update the stack position in the linker scripts
                sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_COMMON
                sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_BOOT
					

				# Print the new stack position 				
                echo -ne "STACK ---> in files link.boot.ld and link.common.ld. ";cat $LINK_COMMON | grep -n "stack" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"	
			else
				echo  -e "\e[93mList of Updated Memory regions:\e[39m"
			fi

			# Update the ROM size in the linker script			
			sed -i -e "s/\(rom\s*:\s*ORIGIN\s*=\s*\)0x$actual_rom_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_rom_size_h*/\10x$actual_rom_origin_h\2 0x$new_size_h/g" $LINK_BOOT
			echo -ne "ROM ---> in file link.boot.ld. ";cat $LINK_BOOT | grep -n "rom" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
			;;

		3) 
			clear
			echo -e "\e[93mModifying DATA_RAM memory ->\e[39m"
			# Debug info
			echo "DATA_RAM starting address: 0x$actual_data_ram_origin_h"
			echo "DATA_RAM size: 0x$actual_data_ram_size_h, that are $actual_data_ram_size bytes"
			echo "Updating the data_ram size will also update the stack position, which is at the end of the data_ram memory and currently occupies $actual_stack_size bytes"
            echo "if you also want to change the stack size, launch again the script and select the options: 2 and then 4"

			# Reading new size and converting it
			echo -n "New desired size (start with 0x to specify an hexadecimal number): "
			read new_size_input

			if [[ $new_size_input == 0x* ]]
			then
				# Convert hexadecimal input to decimal
				new_size_h=${new_size_input#0x}
				new_size=$(( 16#${new_size_h} ))
			else
				# Convert decimal input to hexadecimal
				new_size=${new_size_input}
				new_size_h=$(echo "obase=16;${new_size}" | bc)
			fi

			new_total_data_ram_size=$((new_size+actual_stack_size))
			new_total_data_ram_size_h=$(echo "obase=16;${new_total_data_ram_size}" | bc)
            # Update the DATA_RAM size in the linker script, core_region and sp_ram_wrap 
			sed -i -e "s/\(dataram\s*:\s*ORIGIN\s*=\s*\)0x$actual_data_ram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_data_ram_size_h*/\10x$actual_data_ram_origin_h\20x$new_size_h/g" $LINK_COMMON
            sed -i -e "s/\(\s*DATA_RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $CORE_REGION
            sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $SP_RAM_WRAP
			sed -i -e "s/\(\s*tcdm_bank_size\s*=\s*\)$actual_data_ram_size\b/\1$new_size/g" $S19_TO_SLM
			sed -i -e "s/\(li\s*t4,s*\)$actual_total_data_ram_size_h\b/\1$new_total_data_ram_size_h/g" $CRT0_KLESSYDRA
            echo -ne "DATA_RAM ---> in files link.common.ld, s19toslm.py, crt0.klessydra.S core_region.sv and sp_ram_wrap.sv. ";cat $LINK_COMMON | grep -n "dataram" | head -1 | cut -d ":" -f 3		            

            # Update the stack position
            new_stack_origin=$((actual_data_ram_origin+new_size))
			new_stack_origin_h=$(echo "obase=16;${new_stack_origin}" |bc)
			new_stack_origin_h=$(align_to_32bit_word_exc "$new_stack_origin_h")

            # Update the stack position in the linker scripts
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_COMMON
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_BOOT	

			# Print the new stack position 				
            echo -ne "STACK ---> in files link.boot.ld and link.common.ld. ";cat $LINK_COMMON | grep -n "stack" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"	
			;;
        4)
            clear
            echo -e "\e[93mModifying STACK memory ->\e[39m"
            # Debug info
            echo "STACK starting address: 0x$actual_stack_origin_h"
            echo "STACK size: 0x$actual_stack_size_h, that are $actual_stack_size bytes"

            # Reading new size and converting it
            echo -n "New desired size (start with 0x to specify an hexadecimal number): "
            read new_size_input

            if [[ $new_size_input == 0x* ]]
			then
				# Convert hexadecimal input to decimal
				new_size_h=${new_size_input#0x}
				new_size=$((16#${new_size_h}))
			else
				# Convert decimal input to hexadecimal
				new_size=${new_size_input}
				new_size_h=$(echo "obase=16;${new_size}" | bc)
			fi

			size_per_stack_1=$((new_size/3))
			size_per_stack_h_1=$(echo "obase=16;${size_per_stack_1}" |bc)
			echo "size_per_stack_1= $size_per_stack_1, size_per_stack_h_1 = $size_per_stack_h_1"

			# Align to 32-bit word
			size_per_stack_h=$(align_to_32bit_word_def "$size_per_stack_h_1")
			size_per_stack=$((16#${size_per_stack_h}))
			echo "size_per_stack= $size_per_stack, size_per_stack_h = $size_per_stack_h"
            # Update the stack position in the linker scripts
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(, \s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$actual_stack_origin_h\20x$new_size_h/g" $LINK_COMMON
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(, \s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$actual_stack_origin_h\20x$new_size_h/g" $LINK_BOOT	
			sed -i "s|$actual_size_per_stack|$size_per_stack|g" $KLESSYDRA_DEFS

			


			new_total_data_ram_size=$((actual_data_ram_size+new_stack_size))
			new_total_data_ram_size_h=$(echo "obase=16;${new_total_data_ram_size}" | bc)

			sed -i -e "s/\(\s*DATA_RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $CORE_REGION
            sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $SP_RAM_WRAP
			sed -i -e "s/\(\s*tcdm_bank_size\s*=\s*\)$actual_total_data_ram_size\b/\1$new_size/g" $S19_TO_SLM
			sed -i -e "s/\(li\s*t4,s*\)$actual_total_data_ram_size_h\b/\1$new_total_data_ram_size_h/g" $CRT0_KLESSYDRA
			echo -e "DATA_RAM ---> in files s19toslm.py, crt0.klessydra.S core_region.sv and sp_ram_wrap.sv. "
		    
			
			# Print the new stack position 				
            echo -e "STACK ---> in files link.boot.ld, link.common.ld and klessydra_defs.h. ";cat $LINK_COMMON | grep -n "stack" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"	
            
	esac
	echo -e "\e[93m-----------------------------------\e[39m"
    echo "Thank you for using Klessydra Memory Manager" 


elif (($option==3))
then
    valid_mem=false

	while ! $valid_mem; do
	    echo "Which memory starting address do you want to change?"
	    echo -e "1) INSTRRAM starting address\n2) ROM starting address\n3) DATARAM starting address\n4) STACK starting address"
	    read -r required_memory

	    if ! (( required_memory >= 1 && required_memory <= 4 )); then
	        echo -e "\e[91mError:\e[39m Not a valid option, please try again.\n"
	    else
	        valid_mem=true
	    fi
	done

	echo -e "\e[93m-----------------------------------\e[39m"

	case $required_memory in
        1) 
            # INSTRRAM starting address
            clear
            echo -e "\e[93mModifying INSTRRAM starting address ->\e[39m"
            echo -e "Actual INSTRRAM starting address: 0x$actual_instrram_origin_h"

            # Reading new starting address 
			echo -n "New desired address (in hex): 0x"
			read new_address_h
        	
			# Align to 32-bit word
			new_address_h=$(align_to_32bit_word_exc "$new_address_h")

			# Convert hexadecimal input to decimal
			
            new_address=$(( 16#${new_address_h} ))

            if ((new_address>actual_rom_origin || new_address>actual_data_ram_origin || new_address>actual_stack_origin))
            then
                echo -e "\e[91mError:\e[39m the required starting address overlap the subsequent memory regions. Please, move the next regions before and try again.\n"
                exit
            fi
            new_instrram_origin_h=$new_address_h
            sed -i -e "s/\(instrram\s*:\s*ORIGIN\s*=\s*\)0x$actual_instrram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_instrram_size_h*/\10x$new_instrram_origin_h\20x$actual_instrram_size_h/g" $LINK_COMMON
			sed -i -e "s|l2_start     = 0x$actual_l2_origin_h|l2_start     = 0x$new_instrram_origin_h|" $S19_TO_SLM
            ;;
        2)  
            # ROM starting address
            clear
            echo -e "\e[93mModifying ROM starting address ->\e[39m"
            echo -e "Actual ROM starting address: 0x$actual_rom_origin_h"

            # Reading new starting address
            echo -n "New desired address (in hex): 0x"
			read new_address_h

			# Align to 32-bit word
			new_address_h=$(align_to_32bit_word_exc "$new_address_h")

			# Convert hexadecimal input to decimal
            new_address=$(( 16#${new_address_h} ))
            if ((new_address>actual_data_ram_origin || new_address>actual_stack_origin))
            then
                echo -e "\e[91mError:\e[39m the required starting address overlap the subsequent memory regions!! Please, move the next regions before and try again.\n"
                exit
            elif ((new_address<(actual_instrram_origin+actual_instrram_size)))
            then
                echo -e "\e[91mError:\e[39m the required starting address overlap the previous memory region!! If you want to reduce the previous memory region size use the option 2 in Klessydra Memory Manager and try again.\n"
                exit
            fi
            new_rom_origin_h=$new_address_h
            sed -i -e "s/\(rom\s*:\s*ORIGIN\s*=\s*\)0x$actual_rom_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_rom_size_h*/\10x$new_rom_origin_h\2 0x$actual_rom_size_h/g" $LINK_BOOT
            sed -i -e "s/\(\s*rom_start\s*=\s*\)0x$actual_rom_origin_h\b/\10x$new_rom_origin_h/g" $S19_TO_BOOT
            ;;
        3)  
            # DATARAM starting address
            clear
            echo -e "\e[93mModifying DATARAM starting address ->\e[39m"
            echo -e "Actual DATARAM starting address: 0x$actual_data_ram_origin_h"

            # Reading new starting address
            echo -n "New desired address (in hex): 0x"
            read new_address_h

			# Align to 32-bit word
			new_address_h=$(align_to_32bit_word_exc "$new_address_h")
            new_address=$(( 16#${new_address_h} ))
            if ((new_address<actual_rom_origin+actual_rom_size))
            then
                echo -e "\e[91mError:\e[39m the required starting address overlap the previous memory region!! If you want to reduce the previous memory region size use the option 2 in Klessydra Memory Manager and try again.\n"
                exit
            fi
            new_data_ram_origin_h=$new_address_h
            sed -i -e "s/\(dataram\s*:\s*ORIGIN\s*=\s*\)0x$actual_data_ram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_data_ram_size_h*/\10x$new_data_ram_origin_h\20x$actual_data_ram_size_h/g" $LINK_COMMON

            # We also move the stack origin
            new_stack_origin=$new_address+$actual_data_ram_size
            new_stack_origin_h=$(echo "obase=16;${new_stack_origin}" | bc)
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_COMMON
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_BOOT
            ;;

        4) 
            # STACK starting address
            clear
            echo -e "\e[93mModifying STACK starting address ->\e[39m"
            echo -e "Actual STACK starting address: 0x$actual_stack_origin_h"

            # Reading new starting address
            echo -n "New desired address (in hex): 0x"
            read new_address_h

            # Align to 32-bit word
			new_address_h=$(align_to_32bit_word_exc "$new_address_h")
			new_address=$((16#${new_address_h}))
			
            if ((new_address!=(actual_data_ram_origin+actual_data_ram_size)))
            then
                echo -e "\e[91mError:\e[39m attention, the stack should be placed at the end of DATA_RAM. This is automatically done by moving the starting address of dataram or increasing its size.\n"
                exit
            fi
            new_stack_origin_h=$new_address_h
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_COMMON
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_BOOT
            ;;
    esac
	echo -e "\e[93m-----------------------------------\e[39m"
    echo "Thank you for using Klessydra Memory Manager" 
elif (($option==4))
then
		echo -e "\e[93m-----------------------------------\e[39m"
		echo -e "\e[93mChanging all the Klessydra memory:"
		echo -e "\e[93m-----------------------------------\e[39m"
		echo -e "\e[93mModifying INSTRRAM memory ->\e[39m"


		# Reading new starting address 
		echo -n "New desired address (in hex): 0x"
		read new_address_h

		# Reading new size and converting it
		echo -n "New desired size (start with 0x to specify an hexadecimal number): "
		read new_size_input

		if [[ $new_size_input == 0x* ]]
		then
			# Convert hexadecimal input to decimal
			new_instrram_size_h=${new_size_input#0x}
			new_instrram_size=$((16#${new_instrram_size_h}))
		else
			# Convert decimal input to hexadecimal
			new_instrram_size=${new_size_input}
			new_instrram_size_h=$(echo "obase=16;${new_instrram_size}" | bc)
		fi	

		# Align both to 32-bit word
		new_instrram_origin_h=$(align_to_32bit_word_def "$new_address_h")
		new_instrram_origin=$(( 16#${new_address_h} ))

		

		#--------------------------------
		echo -e "\e[93mModifying ROM memory ->\e[39m"

		# Reading new starting address
		echo -n "New desired address (in hex): 0x"
		read new_address_h

		# Reading new size and converting it
		echo -n "New desired size (start with 0x to specify an hexadecimal number): "
		read new_size_input

		if [[ $new_size_input == 0x* ]]
		then
			# Convert hexadecimal input to decimal
			new_rom_size_h=${new_size_input#0x}
			new_rom_size=$((16#${new_rom_size_h}))
		else
			# Convert decimal input to hexadecimal
			new_rom_size=${new_size_input}
			new_rom_size_h=$(echo "obase=16;${new_rom_size}" | bc)
		fi

		# Align both to 32-bit word
		new_rom_origin_h=$(align_to_32bit_word_def "$new_address_h")
		new_rom_origin=$(( 16#${new_address_h} ))

		if ((new_rom_origin<new_instrram_origin+new_instrram_size))
		then
			echo -e "\e[91mError:\e[39m The new ROM memory overlaps the INSTRRAM memory. Please try again."
			exit 1
		fi
		

		#--------------------------------
		echo -e "\e[93mModifying DATARAM memory ->\e[39m"

		# Reading new starting address
		echo -n "New desired address (in hex): 0x"
		read new_address_h

		# Reading new size and converting it
		echo -n "New desired size (start with 0x to specify an hexadecimal number): "
		read new_size_input

		if [[ $new_size_input == 0x* ]]
		then
			# Convert hexadecimal input to decimal
			new_data_ram_size_h=${new_size_input#0x}
			new_data_ram_size=$((16#${new_data_ram_size_h}))
		else
			# Convert decimal input to hexadecimal
			new_data_ram_size=${new_size_input}
			new_data_ram_size_h=$(echo "obase=16;${new_data_ram_size}" | bc)
		fi

		# Align both to 32-bit word
		new_data_ram_origin_h=$(align_to_32bit_word_def "$new_address_h")
		new_data_ram_origin=$(( 16#${new_address_h} ))
		
		if ((new_data_ram_origin<new_rom_origin+new_rom_size))
		then
			echo -e "\e[91mError:\e[39m The new DATARAM memory overlaps the ROM memory. Please try again."
			exit 1
		fi

		#--------------------------------
		echo -ne "\e[93mModifying STACK ->\e[39m"
		echo "Insert now the new size (NOTE: the stack origin is always fixed at the end of the dataram):"

		# Reading new size and converting it
		echo -n "New desired size (start with 0x to specify an hexadecimal number): "
		read new_size_input

		if [[ $new_size_input == 0x* ]]
		then
			# Convert hexadecimal input to decimal
			new_stack_size_h=${new_size_input#0x}
			new_stack_size=$((16#${new_stack_size_h}))
		else
			# Convert decimal input to hexadecimal
			new_stack_size=${new_size_input}
			new_stack_size_h=$(echo "obase=16;${new_stack_size}" | bc)
		fi

		new_stack_origin=$((new_data_ram_origin+new_data_ram_size))
		new_stack_origin_h=$(echo "obase=16;${new_stack_origin}" | bc)

		size_per_stack=$((new_stack_size/3))
		size_per_stack_h=$(echo "obase=16;${size_per_stack}" | bc)

		# Align to 32-bit word
		size_per_stack_h=$(align_to_32bit_word_def "$size_per_stack_h")
		size_per_stack=$((16#${size_per_stack_h}))
				
		new_total_data_ram_size=$((new_data_ram_size+new_stack_size))
		new_total_data_ram_size_h=$(echo "obase=16;${new_total_data_ram_size}" | bc)


		# Update the INSTRRAM position 
		slm_new_instrram_size=$((new_instrram_size/4))
		sed -i -e "s/\(instrram\s*:\s*ORIGIN\s*=\s*\)0x$actual_instrram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_instrram_size_h*/\10x$new_instrram_origin_h\2 0x$new_instrram_size_h/g" $LINK_COMMON
		sed -i -e "s/\(\s*INSTR_RAM_SIZE\s*=\s*\)$actual_instrram_size\b/\1$new_instrram_size/g" $CORE_REGION
		sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_instrram_size\b/\1$new_instrram_size/g" $INSTR_RAM_WRAP
		sed -i -e "s/\(\s*l2_bank_size\s*=\s*\)$slm_actual_instrram_size\b/\1$slm_new_instrram_size/g" $S19_TO_SLM
		sed -i -e "s|l2_start     = 0x$actual_l2_origin_h|l2_start     = 0x$new_instrram_origin_h|" $S19_TO_SLM

				# Update ROM
		sed -i -e "s/\(rom\s*:\s*ORIGIN\s*=\s*\)0x$actual_rom_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_rom_size_h*/\10x$new_rom_origin_h\20x$new_rom_size_h/g" $LINK_BOOT		
		sed -i -e "s/\(\s*rom_start\s*=\s*\)0x$actual_rom_origin_h\b/\10x$new_rom_origin_h/g" $S19_TO_BOOT

		# Update dataram sizes and address
		sed -i -e "s/\(dataram\s*:\s*ORIGIN\s*=\s*\)0x$actual_data_ram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_data_ram_size_h*/\10x$new_data_ram_origin_h\20x$new_data_ram_size_h/g" $LINK_COMMON
		sed -i -e "s/\(\s*tcdm_start\s*=\s*\)0x$actual_data_ram_origin_h\b/\10x$new_data_ram_origin_h/g" $S19_TO_SLM
		sed -i -e "s/\(\s*DATA_RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $CORE_REGION
		sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $SP_RAM_WRAP	
		sed -i -e "s/\(\s*tcdm_bank_size\s*=\s*\)$actual_data_ram_size\b/\1$new_data_ram_size/g" $S19_TO_SLM
		sed -i -e "s/\(li\s*t4,s*\)$actual_total_data_ram_size_h\b/\1$new_total_data_ram_size_h/g" $CRT0_KLESSYDRA

		# Update the stack position in the linker scripts
		sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(, \s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$new_stack_size_h/g" $LINK_COMMON
		sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(, \s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$new_stack_size_h/g" $LINK_BOOT	
		sed -i "s|$actual_size_per_stack|$size_per_stack|g" $KLESSYDRA_DEFS
		
		clear

		echo -e "\e[93m-----------------------------------\e[39m"
		echo -e "\e[93mRECAP ---->"
		echo -e "\e[93m-----------------------------------\e[39m"
		echo "New INSTRRAM starting address: 0x$new_instrram_origin_h"
		echo "New INSTRRAM size: 0x$new_instrram_size_h, that are $new_instrram_size bytes"
		
		echo "New ROM starting address: 0x$new_rom_origin_h"
		echo "New ROM size: 0x$new_rom_size_h, that are $new_rom_size bytes"


		echo "New DATARAM size: 0x$new_data_ram_size_h, that are $new_data_ram_size bytes"
		echo "New DATARAM starting address: 0x$new_data_ram_origin_h"
		echo "New total DATARAM size: 0x$new_total_data_ram_size_h, that are $new_total_data_ram_size bytes"
		echo "New STACK starting address: 0x$actual_stack_origin_h"
		echo "New STACK size: 0x$new_stack_size_h, that are $new_stack_size bytes"
		echo "New STACK size per thread: 0x$size_per_stack_h, that are $size_per_stack bytes"
		echo -e "\e[93m-----------------------------------\e[39m"
        echo "Thank you for using Klessydra Memory Manager" 


elif (($option==5))
then
	echo "Do you want to restore the original memory sizes? (y or n)"
	read answer
	if [[ $answer == [Yy] ]]; then

		# INSTR_RAM reset
		new_instrram_origin_h=00000		
		new_instrram_size_h=20000
        new_instrram_size=131072
		slm_new_instrram_size=$((new_instrram_size/4))
		sed -i -e "s/\(instrram\s*:\s*ORIGIN\s*=\s*\)0x$actual_instrram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_instrram_size_h*/\10x$new_instrram_origin_h\2 0x$new_instrram_size_h/g" $LINK_COMMON
		sed -i -e "s/\(\s*INSTR_RAM_SIZE\s*=\s*\)$actual_instrram_size\b/\1$new_instrram_size/g" $CORE_REGION
        sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_instrram_size\b/\1$new_instrram_size/g" $INSTR_RAM_WRAP
		sed -i -e "s/\(\s*l2_bank_size\s*=\s*\)$slm_actual_instrram_size\b/\1$slm_new_instrram_size/g" $S19_TO_SLM
		sed -i -e "s|l2_start     = 0x$actual_l2_origin_h|l2_start     = 0x$new_instrram_origin_h|" $S19_TO_SLM
        
		# ROM reset		
		new_rom_origin_h=20000	
		new_rom_size_h=2000	
		sed -i -e "s/\(rom\s*:\s*ORIGIN\s*=\s*\)0x$actual_rom_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_rom_size_h*/\10x$new_rom_origin_h\20x$new_rom_size_h/g" $LINK_BOOT		
		sed -i -e "s/\(\s*rom_start\s*=\s*\)0x$actual_rom_origin_h\b/\10x$new_rom_origin_h/g" $S19_TO_BOOT
		
		# DATA_RAM reset		
		new_data_ram_origin_h=00100000
		new_data_ram_size_h=EF00000	
		new_data_ram_size=251658240
        new_total_data_ram_size=267386880
		new_total_data_ram_size_h=10000000
		sed -i -e "s/\(dataram\s*:\s*ORIGIN\s*=\s*\)0x$actual_data_ram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_data_ram_size_h*/\10x$new_data_ram_origin_h\20x$new_data_ram_size_h/g" $LINK_COMMON
		sed -i -e "s/\(\s*tcdm_start\s*=\s*\)0x$actual_data_ram_origin_h\b/\10x$new_data_ram_origin_h/g" $S19_TO_SLM
		sed -i -e "s/\(\s*DATA_RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $CORE_REGION
        sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $SP_RAM_WRAP	
		sed -i -e "s/\(\s*tcdm_bank_size\s*=\s*\)$actual_data_ram_size\b/\1$new_data_ram_size/g" $S19_TO_SLM
		sed -i -e "s/\(li\s*t4,s*\)$actual_total_data_ram_size_h\b/\1$new_total_data_ram_size_h/g" $CRT0_KLESSYDRA
		
		
		# STACK reset
		new_stack_origin_h=0F000000
		new_stack_size_h=1000000
		size_per_stack=131072
        sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$new_stack_size_h/g" $LINK_COMMON
        sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$new_stack_size_h/g" $LINK_BOOT
		sed -i "s|$actual_size_per_stack|$size_per_stack|g" $KLESSYDRA_DEFS
		
		echo -e "\e[93mOriginal Memory Sizes Restored\e[39m"
        echo -e "\e[93m-----------------------------------\e[39m"
        echo "Thank you for using Klessydra Memory Manager" 
		exit
	fi
elif (($option==6))
then
    clear
    echo -e "\e[93m-----------------------------------\e[39m"
    echo -e "\e[93mScratchPad Memories Manager--->\e[39m"
    
    # Read the actual SPM size
    echo "Specify the name of your build folder (e.g. Morph_build): "
    read build_folder
    actual_SPM_SIZE=$(cat $PULPINO_DIR/sw/$build_folder/cmake_configure.klessydra-m.gcc.sh|grep KLESS_Addr_Width|head -1|cut -d "=" -f 2 | cut -d "#" -f 1|tr -d "[:blank:]")
    echo -n "Actual addr_width: $actual_SPM_SIZE, SPMs size = "
    echo "2^$actual_SPM_SIZE" | bc
    
    # Read the new SPM size
    echo -n "Insert the new desired addr_width: "
    read new_SPM_SIZE
    
    # Check if the input is a two-digit number
    if ! [[ $new_SPM_SIZE =~ ^[0-9]{2}$ ]]; then
        echo "Invalid input: $new_SPM_SIZE is not a two-digit number."
        exit
    fi

    # Replace the actual SPM size with the new one
    sed -i -e "s/KLESS_Addr_Width=\b[0-9]\{2\}\b/KLESS_Addr_Width=$new_SPM_SIZE/g" $PULPINO_DIR/sw/$build_folder/cmake_configure.klessydra-m.gcc.sh
    echo -n "New addr_width: $new_SPM_SIZE, NEW SPMs size = "
    echo "2^$new_SPM_SIZE" | bc
    echo -e "\e[93m-----------------------------------\e[39m"
    
    # Print the new SPMs addresses
    let SPMA=(2**$new_SPM_SIZE * 0 + 0x10000000)
    let SPMB=(2**$new_SPM_SIZE * 1 + 0x10000000)
    let SPMC=(2**$new_SPM_SIZE * 2 + 0x10000000)
    let SPMD=(2**$new_SPM_SIZE * 3 + 0x10000000)
    printf '%s' '-'
    printf " SPMA= 0x%x" $SPMA
    printf $'\n'
    printf '%s' '-'
    printf " SPMB= 0x%x" $SPMB
    printf $'\n'
    printf '%s' '-'
    printf " SPMC= 0x%x" $SPMC
    printf $'\n'
    printf '%s' '-'
    printf " SPMD= 0x%x" $SPMD
    printf $'\n'
    SPMA_hex=$(echo "obase=16;${SPMA}" | bc)
    SPMB_hex=$(echo "obase=16;${SPMB}" | bc)
    SPMC_hex=$(echo "obase=16;${SPMC}" | bc)
    SPMD_hex=$(echo "obase=16;${SPMD}" | bc)
    # Replace the actual SPMs addresses with the new ones in the DSP_FUNCTIONS file
    sed -i -e "/^#define spmaddrA/s/0x[0-9a-f]\{1,\}/0x$SPMA_hex/g" $DSP_FUNCTIONS
    sed -i -e "/^#define spmaddrB/s/0x[0-9a-f]\{1,\}/0x$SPMB_hex/g" $DSP_FUNCTIONS
    sed -i -e "/^#define spmaddrC/s/0x[0-9a-f]\{1,\}/0x$SPMC_hex/g" $DSP_FUNCTIONS
    sed -i -e "/^#define spmaddrD/s/0x[0-9a-f]\{1,\}/0x$SPMD_hex/g" $DSP_FUNCTIONS
	echo -e "\e[93m-----------------------------------\e[39m"
    echo "Thank you for using Klessydra Memory Manager" 
elif (($option==7))
then
    clear
    # Change the PULPINO_DIR variable in the configuration file
    echo "Specify the path of your pulpino-klessydra folder (e.g. /home/user/pulpino-klessydra): "
    read PULPINO_DIR
    echo "PULPINO_DIR=$PULPINO_DIR" > "$CONFIG_FILE"    
    touch "$CONFIG_FILE"
    echo "program_opened=true" >> "$CONFIG_FILE"
	echo -e "\e[93m-----------------------------------\e[39m"
    echo "Thank you for using Klessydra Memory Manager" 

elif (($option==8))
then
	echo "Thank you for using Klessydra Memory Manager"

fi



