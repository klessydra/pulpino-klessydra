<p align="center">
	<img src="https://raw.githubusercontent.com/pulp-platform/pulpino/master/doc/datasheet/figures/pulpino_logo_inline1.png" width="400px" />
	<img style="float: right;" src="/pics/Klessydra_Logo.png" width="400">
</p>

# Introduction

This project is a merger of Pulpino and Klessydra. It is an integration of the Klessydra Cores, and software test suite and libraries inside PULPino

# Klesydra Introduction

Klessydra is a family of processing cores designed at the Digital System's Laboratory at the University of Sapienza in Rome. Klessydra features a whole class of different processing cores ranging from in-order execution to out-of-order execution cores, single threaded to multi-threaded, from non-fault tolerant to fault tolerant temporaly redundant or spatially redundant, and lastly from hardware static to hardware dynamic processor architectures.

Klessydra features as well an integrated highly configurable pipelined Vector Coprocessing Unit (VCU) that can execute vector operations in SIMD / MIMD fashion exploiting both Data Level Parallelism (DLP) and Thread Level Parallelism (TLP). The VCU features a configurable set of Scratchpad Memories that are coupled with the Vector Engine, with a wide enough data bus to support the large bandwidth of the SIMD functional units. The VCU additionally features sub-word type parallelism in which small functional units capable of working on low percision data coallate together to form a larger functional unit.

Klessydra is not only limited to hardware implementations, it features as well a wide class of software test suite and libraries to verify, benchmark, and evaluate the Klessydra processing cores. The integrated test environments range from Single threaded applications, to multi-threaded decoupled, lightly coupled, or tightly coupled multi-threaded applications. As well as accelerated applications that target the different configurations of the VCU. The tests suite includes a set of libraries that integrate important functions that can be used to design your own application to exploit the features of the Klessydra Cores.

Klessydra started from a single cycle in-order execution core in the early days, and continues to grow till this day.

# PULPino Introduction

PULPino is an open-source single-core microcontroller system, based on 32-bit
RISC-V cores developed at ETH Zurich. PULPino is configurable to use either 
the RISCY or the Zero-riscy core.

RISCY is an in-order, single-issue core with 4 pipeline stages and it has
an IPC close to 1, full support for the base integer instruction set (RV32I),
compressed instructions (RV32C) and multiplication instruction set
extension (RV32M). It can be configured to have single-precision floating-point
instruction set extension (RV32F). It implements several custom ISA extensions such as:
hardware loops, post-incrementing load and store instructions, bit-manipulation
instructions, MAC operations, support fixed-point operations, packed-SIMD instructions
and the dot product. It has been designed to increase the energy efficiency of
in ultra-low-power signal processing applications.
RISCY implementes a subset of the 1.9 privileged specification.
Further informations can be found in http://ieeexplore.ieee.org/abstract/document/7864441/.

Zero-riscy is an in-order, single-issue core with 2 pipeline stages and it has
full support for the base integer instruction set (RV32I) and 
compressed instructions (RV32C). It can be configured to have multiplication instruction set
extension (RV32M) and the reduced number of registers extension (RV32E).
It has been designed to target ultra-low-power and ultra-low-area constraints.
zero-riscy implementes a subset of the 1.9 privileged specification.

When the core is idle, the platform can be put into a low power mode, 
where only a simple event unit is active and everything else is clock-gated and consumes minimal power (leakage).
A specialized event unit wakes up the core in case an event/interrupt arrives.

For communication with the outside world, PULPino contains a broad set of
peripherals, including I2S, I2C, SPI and UART. The platform internal devices
can be accessed from outside via JTAG and SPI which allows pre-loading
RAMs with executable code. In standalone mode, the platform boots from an
internal boot ROM and loads its program from an external SPI flash.

The PULPino platform is available for RTL simulation as well FPGA.
PULPino has been taped-out as an ASIC in UMC 65nm in January 2016. It has full
debug support on all targets. In addition we support extended profiling with
source code annotated execution times through KCacheGrind in RTL simulations.

## Requirements

PULPino has the following requirements

- ModelSim in reasonably recent version (we tested it with versions >= 10.2c)
- CMake >= 2.8.0, versions greater than 3.1.0 recommended due to support for ninja
- riscv-toolchain, specifically you need riscv32-unknown-elf-gcc compiler and
  friends. There are two choices for this toolchain: Either using the official
  RISC-V toolchain supported by Berkeley or the custom RISC-V toolchain from
  ETH. The ETH versions supports all the ISA extensions that were incorporated
  into the RI5CY core as well as the reduced base instruction set for zero-riscy.
  Please make sure you are using the newlib version of the toolchain.
- python2 >= 2.6
- verilator 3.884 only necessary if you want to use Verilator to evaluate PULPino.

## ISA Support

PULPino originally could run either with RISCY or zero-riscy. Now it is integrated with all the shades of the Klessydra cores
An intuitive GUI, one of the submodules downloaded by this repo, can be used to configure PULPino-Klessydra to use and customize the cores, and run the tests.

## Version Control

PULPino-Klessydra uses multiple git submodules. The submodules from PULPino were integrated directly into this repository to avoid any conflicts in case those submodules were removed in the future. The submodules from Klessydra can be directly downloaded, fetched. and updated once the update python script is launched. 

## Version Control

1.	Install the following packeges:
		
		sudo apt-get install git cmake python-yaml tcsh autoconf automake autotools-dev curl libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev

2.	Download and build the "ri5cy_gnu_toolchain" from PULP

		a) git clone https://github.com/pulp-platform/ri5cy_gnu_toolchain.git
		
		b) cd ri5cy_gnu_toolchain
		
		c) make ZERORISCY=1

		d) in case you need to build for RISCY cores, then just do "make" instead, and then add the symbolic links as shown from step 4.
		
	When the build is done, add the path **_<path_to_toolchain>/ri5cy_gnu_toolchain/install/bin_**, to the $PATH variable

3.	To run the klessydra tests, you have to the Klessydra version of the riscv-gnu-toolchain , and build it:
	
	https://github.com/klessydra/riscv-gnu-toolchain	 

4.	Download PULPino-Klessydra:

		a) git clone https://github.com/klessydra/pulpino-klessydra
		
		b) cd pulpino-klessydra
		
		c) ./update-ips.py	

5.	OPTIONAL: After the update scipt is done, then you will be able to test Klessydra-m.
		-Navigate to "sw" folder inside pulpino and execute the following commands

		a) mkdir build
		
		b) cp cmake_configure.klessydra-m.gcc.sh build/
		
		c) run KView.py and configure and run everything from the GUI or continue through steps d-f

		d) cd build
		
		e) ./cmake_configure.klessydra-m.gcc.sh
		   
		f) make vcompile

		For running Klessydra tests; make sure the variable "USE_KLESSYDRA_TEST" in the above bash script is set to '1' by default. You only need to build and run your test
		g) To run an accelerated test (e.g.  make KDOTP_test.vsimc)

		h) To run a non-accelerated test (e.g.  make barrier_test.vsimc)
		
		i) You can also run one of the PULPino native tests,  (e.g. make testALU.vsimc)
			
	IT"S DONE!!!!!!

Supplimentary Information:

6.	In order to run tests under Modelsim gui mode, navigate again to the build folder and do the following: make nameofthetest.vsim (while .vsimc runs the test under Modelsim in background)


7. Klessydra libraries are available, and their functions are described in the software runtime manual found in the Docs folder


## Documentation

There is a preliminary PULPino datasheet available that includes a block diagram and a memory map of PULPino.
See docs/datasheet/ in this repository.

It is written in LaTeX and there is no pdf included in the repository. Simply type

    make all

inside the folder to generate the pdf. Note that you need a working version of latex for this step.


## Running simulations

The software is built using CMake.
Create a build folder somewhere, e.g. in the sw folder

    mkdir build

Copy the cmake-configure.{*}.gcc.sh bash script to the build folder.
This script can be found in the sw subfolder of the git repository.

Modify the cmake-configure script to your needs and execute it inside the build folder.
This will setup everything to perform simulations using ModelSim.

Run the KVIEW.py application to configure the Klessydra or the RISCY cores. Then compile them and run


Inside the build folder or KVIEW, execute:

    make vcompile

to compile the RTL libraries using ModelSim.

To run a simulation in the modelsim GUI use

    make helloworld.vsim


To run simulations in the modelsim console use

    make helloworld.vsimc

This will output a summary at the end of the simulation.
This is intended for batch processing of a large number of tests.

Replace helloworld with the test/application you want to run.


### Using ninja instead of make

You can use ninja instead make to build software for PULPino, just replace all
occurrences of make with ninja.
The same targets are supported on both make and ninja.



## Interactive debug

To interactively debug software via gdb, you need the jtag bridge as well as a
working version of gdb for the ISA you want to debug. The debug bridge depends
on the `jtag_dpi` package that emulates a JTAG port and provides a TCP socket
to which the jtag bridge can connect to.


## Utilities

PULPino additionally provide some utilitiy targets that are supposed to make
development for PULPino easier.

For disassembling a program call

    make helloworld.read

To regenerate the bootcode and copy it to the `rtl` folder use

    make boot_code.install

## FPGA

PULPino-Klessydra can be synthesized and run on a ZedBoard.
Take a look at the `fpga` subfolder for more information.

## Arduino compatible libraries

Most of official Arduino libraries are supported by PULPino software, they can
be compiled, simulated and uploded the same way as traditional software programs
using the available PULPino utilities. You only need to include main.cpp at the
beginning of the program:

	#include "main.cpp"

Take a look at the `sw/libs/Arduino_libs` subfolder for more information about
the status of the currently supported libraries.
