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
# Version: 1.0, 17/04/2023
# Marco Angioli, Sapienza University of Rome

#!/bin/bash
echo -e "\e[93m-----------------------------------\e[39m"
echo -e "\e[93m\e[1m    Klessydra Memory Manager \e[1m\e[39m"
echo -e "\e[93m\e[1m     	     v. 1.0          \e[0m\e[39m"
echo -e "\e[93m-----------------------------------\e[39m"

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
DSP_FUNCTIONS=$PULPINO_DIR/sw/libs/klessydra_lib/dsp_libs/inc/dsp_functions.h

#---------------------------------------------------------------------
# Script Header
valid=false
while ! $valid; do
    echo "Specified pulpino-klessydra directory: $PULPINO_DIR"
    echo "What do you want to do?"
    echo "- 1: View a detailed overview of the actual memory"
    echo "- 2: Change the memory size"
	echo "- 3: Change the memory starting addresses"
	echo "- 4: Reset memory regions to the default configuration"
	echo "- 5: Change the ScratchPad Memories (SPMs) size"
    echo "- 6: Change Pulpino directory"
	echo "- 7: Exit"
    read -r option
    echo -e "\e[93m-----------------------------------\e[39m"
 
    if ! (( option == 1 || option == 2 || option == 3 || option == 4 || option == 5 || option == 6 || option == 7 )); then
        echo -e "\e[91mError:\e[39m Not a valid option, please try again.\n"
	elif (( option == 7 )); then
		echo "Thank you for using Klessydra Memory Manager"
		exit
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
actual_total_data_ram_size=$(( actual_data_ram_size + actual_stack_size )) # DATA_RAM + STACK size in decimal
echo "actual_total_data_ram_size=$actual_total_data_ram_size"
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
 

	# ROM:
	echo -e "\n\e[4m\e[1mROM->\e[0m"
	echo -e "In file \e[36m$LINK_BOOT ->\e[39m"
	cat $LINK_BOOT   | grep -n "rom"      | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$S19_TO_BOOT ->\e[39m"
	cat $S19_TO_BOOT | grep -n "rom_start"| head -1 | cut -d ":" -f 2-|tr -d "[:blank:]"
	cat $S19_TO_BOOT | grep -n "rom_size" | head -1 | cut -d ":" -f 2-|tr -d "[:blank:]"|cut -d "#" -f 1|tr "\n" " "; echo  -e " --> space allocated for the \e[4mboot memory\e[0m.\nIt can not be automatically changed in this version of Klessydra Manager "



	# DATARAM:
	echo -e "\n\e[4m\e[1mDATARAM->\e[0m"
	echo -e "In file \e[36m$LINK_COMMON ->\e[39m"
	cat $LINK_COMMON | grep -n "dataram"       | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$CORE_REGION ->\e[39m"
	cat $CORE_REGION    | grep -n "DATA_RAM_SIZE" | head -1 | cut -d ":" -f 2- |tr "parameter" " "|cut -d ',' -f 1|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$SP_RAM_WRAP ->\e[39m"
	cat $SP_RAM_WRAP    | grep -n "RAM_SIZE"      | head -1 | cut -d ":" -f 2- |tr "parameter" " "|cut -d ',' -f 1|tr -d "[:blank:]"

	# STACK:
	echo -e "\n\e[4m\e[1mSTACK->\e[0m"
	echo -e "In file \e[36m$LINK_BOOT ->\e[39m"
	cat $LINK_BOOT   | grep -n "stack"| head -1| cut -d ":" -f 3|tr -d "[:blank:]"
	echo -e "\nIn file \e[36m$LINK_COMMON ->\e[39m"
	cat $LINK_COMMON | grep -n "stack"| head -1| cut -d ":" -f 3|tr -d "[:blank:]"

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
				new_rom_origin=$((actual_instrram_origin+$new_size))
				new_rom_origin_h=$(echo "obase=16;${new_rom_origin}" |bc)
				echo -ne "ROM ---> in files link.boot.ld and s19toboot.py. ";cat $LINK_BOOT | grep -n "rom" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
				sed -i "s/\(rom\s*:\s*ORIGIN\s*=\s*\)0x$actual_rom_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_rom_size_h*/\10x$new_rom_origin_h\2 0x$actual_rom_size_h/g" $LINK_BOOT		
				sed -i -e "s/\(\s*rom_start\s*=\s*\)0x$actual_rom_origin_h\b/\10x$new_rom_origin_h/g" $S19_TO_BOOT
                
							
				# Check if the new ROM position overlaps the subsequent memory region
				if (($new_rom_origin_h+$actual_rom_size > $actual_data_ram_origin))
				then
					# Update the DATA_RAM memory starting address, accordingly to the new ROM position
					new_data_ram_origin=$((new_rom_origin+new_size))
					new_data_ram_origin_h=$(echo "obase=16;${new_data_ram_origin_h}" |bc)
					sed -i -e "s/\(dataram\s*:\s*ORIGIN\s*=\s*\)0x$actual_data_ram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_data_ram_size_h*/\10x$new_data_ram_origin_h\20x$actual_data_ram_size_h/g" $LINK_COMMON
                    
					# Print the new DATA_RAM starting address
                    echo -ne "DATA_RAM ---> in file link.common.ld. ";cat $LINK_COMMON | grep -n "dataram" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
								

					# Update the stack position
					new_stack_origin=$((new_data_ram_origin+data_ram_size))
					new_stack_origin_h=$(echo "obase=16;${new_stack_origin}" |bc)

					# Update the stack position in the linker scripts
                    sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_COMMON
                    sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_BOOT	

					# Print the new stack position 				
                    echo -ne "STACK ---> in files link.boot.ld and link.common.ld. ";cat $LINK_COMMON | grep -n "stack" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"	
				fi
			else
				echo  -e "\e[93mList of Updated Memory regions:\e[39m"
			fi

			# Update the INSTR_RAM size in the linker script, the core_region.sv and the instr_ram_wrap.sv
			sed -i -e "s/\(instrram\s*:\s*ORIGIN\s*=\s*\)0x$actual_instrram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_instrram_size_h*/\10x$actual_instrram_origin_h\20x$new_size_h/g" $LINK_COMMON
            sed -i -e "s/\(\s*INSTR_RAM_SIZE\s*=\s*\)$actual_instrram_size\b/\1$new_size/g" $CORE_REGION
            sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_instrram_size\b/\1$new_size/g" $INSTR_RAM_WRAP
			echo -ne "INSTRRAM UPDATED ---> in files: link.common.ld, core_region.sv, instr_ram_wrap.sv. ";cat $LINK_COMMON | grep -n "instrram" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
			echo -e "\nThank you for using Klessydra Memory Manager"
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
				sed -i -e "s/\(dataram\s*:\s*ORIGIN\s*=\s*\)0x$actual_data_ram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_data_ram_size_h*/\10x$new_data_ram_origin_h\20x$actual_data_ram_size_h/g" $LINK_COMMON
                echo -ne "DATA_RAM ---> in file link.common.ld. ";cat $LINK_COMMON | grep -n "dataram" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"
																	
				# Update the stack position
				new_stack_origin=$((new_data_ram_origin+data_ram_size))
				new_stack_origin_h=$(echo "obase=16;${new_stack_origin}" |bc)

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
			echo -e "\nThank you for using Klessydra Memory Manager"
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
            # Update the DATA_RAM size in the linker script, core_region and sp_ram_wrap 
			sed -i -e "s/\(dataram\s*:\s*ORIGIN\s*=\s*\)0x$actual_data_ram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_data_ram_size_h*/\10x$actual_data_ram_origin_h\20x$new_size_h/g" $LINK_COMMON
            sed -i -e "s/\(\s*DATA_RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $CORE_REGION
            sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $SP_RAM_WRAP
            echo -ne "DATA_RAM ---> in files link.common.ld, core_region.sv and sp_ram_wrap.sv. ";cat $LINK_COMMON | grep -n "dataram" | head -1 | cut -d ":" -f 3		            

            # Update the stack position
            new_stack_origin=$((actual_data_ram_origin+new_size))
			new_stack_origin_h=$(echo "obase=16;${new_stack_origin}" |bc)

            # Update the stack position in the linker scripts
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_COMMON
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$actual_stack_size_h/g" $LINK_BOOT	

			# Print the new stack position 				
            echo -ne "STACK ---> in files link.boot.ld and link.common.ld. ";cat $LINK_COMMON | grep -n "stack" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"	
			echo -e "\nThank you for using Klessydra Memory Manager"
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

            # Update the stack position in the linker scripts
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(, \s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$actual_stack_origin_h\20x$new_size_h/g" $LINK_COMMON
            sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(, \s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$actual_stack_origin_h\20x$new_size_h/g" $LINK_BOOT	
			# Print the new stack position 				
            echo -ne "STACK ---> in files link.boot.ld and link.common.ld. ";cat $LINK_COMMON | grep -n "stack" | head -1 | cut -d ":" -f 3|tr -d "[:blank:]"	
			echo -e "\nThank you for using Klessydra Memory Manager"
            
	esac

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
            
            new_address=$(( 16#${new_address_h} ))
            if ((new_address>actual_rom_origin || new_address>actual_data_ram_origin || new_address>actual_stack_origin))
            then
                echo -e "\e[91mError:\e[39m the required starting address overlap the subsequent memory regions. Please, move the next regions before and try again.\n"
                exit
            fi
            new_instrram_origin_h=$new_address_h
            sed -i -e "s/\(instrram\s*:\s*ORIGIN\s*=\s*\)0x$actual_instrram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_instrram_size_h*/\10x$new_instrram_origin_h\20x$actual_instrram_size_h/g" $LINK_COMMON
            ;;
        2)  
            # ROM starting address
            clear
            echo -e "\e[93mModifying ROM starting address ->\e[39m"
            echo -e "Actual ROM starting address: 0x$actual_rom_origin_h"

            # Reading new starting address
            echo -n "New desired address (in hex): 0x"
			read new_address_h
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

elif (($option==4))
then
	echo "Do you want to restore the original memory sizes? (y or n)"
	read answer
	if [[ $answer == [Yy] ]]; then

		# INSTR_RAM reset
		new_instrram_origin_h=00000		
		new_instrram_size_h=20000
        new_instrram_size=131072
		sed -i -e "s/\(instrram\s*:\s*ORIGIN\s*=\s*\)0x$actual_instrram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_instrram_size_h*/\10x$new_instrram_origin_h\2 0x$new_instrram_size_h/g" $LINK_COMMON
		sed -i -e "s/\(\s*INSTR_RAM_SIZE\s*=\s*\)$actual_instrram_size\b/\1$new_instrram_size/g" $CORE_REGION
        sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_instrram_size\b/\1$new_instrram_size/g" $INSTR_RAM_WRAP
        
		# ROM reset		
		new_rom_origin_h=20000	
		new_rom_size_h=2000	
		sed -i -e "s/\(rom\s*:\s*ORIGIN\s*=\s*\)0x$actual_rom_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_rom_size_h*/\10x$new_rom_origin_h\20x$new_rom_size_h/g" $LINK_BOOT		
		sed -i -e "s/\(\s*rom_start\s*=\s*\)0x$actual_rom_origin_h\b/\10x$new_rom_origin_h/g" $S19_TO_BOOT
		
		# DATA_RAM reset		
		new_data_ram_origin_h=00100000
		new_data_ram_size_h=EF00000	
        new_total_data_ram_size=267386880
		sed -i -e "s/\(dataram\s*:\s*ORIGIN\s*=\s*\)0x$actual_data_ram_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_data_ram_size_h*/\10x$new_data_ram_origin_h\20x$new_data_ram_size_h/g" $LINK_COMMON
		sed -i -e "s/\(\s*DATA_RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $CORE_REGION
        sed -i -e "s/\(\s*RAM_SIZE\s*=\s*\)$actual_total_data_ram_size\b/\1$new_total_data_ram_size/g" $SP_RAM_WRAP	
		
		# STACK reset
		new_stack_origin_h=0F000000
		new_stack_size_h=1000000
        sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$new_stack_size_h/g" $LINK_COMMON
        sed -i -e "s/\(stack\s*:\s*ORIGIN\s*=\s*\)0x$actual_stack_origin_h*\(,\s*LENGTH\s*=\s*\)0x$actual_stack_size_h*/\10x$new_stack_origin_h\20x$new_stack_size_h/g" $LINK_BOOT
		echo -e "\e[93mOriginal Memory Sizes Restored\e[39m"
        echo -e "\e[93m-----------------------------------\e[39m"
        echo "Thank you for using Klessydra Memory Manager" 
		exit
	fi
elif (($option==5))
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
elif (($option==6))
then
    clear
    # Change the PULPINO_DIR variable in the configuration file
    echo "Specify the path of your pulpino-klessydra folder (e.g. /home/user/pulpino-klessydra): "
    read PULPINO_DIR
    echo "PULPINO_DIR=$PULPINO_DIR" > "$CONFIG_FILE"    
    touch "$CONFIG_FILE"
    echo "program_opened=true" >> "$CONFIG_FILE"

fi



