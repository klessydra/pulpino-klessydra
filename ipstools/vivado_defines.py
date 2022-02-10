#!/usr/bin/env python
#
# vivado_defines.py
# Francesco Conti <f.conti@unibo.it>
#
# Copyright (C) 2015 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

VIVADO_PREAMBLE = """if ![info exists PULP_HSA_SIM] {
    set IPS ../../%s
    set FPGA_IPS ../ips
    set FPGA_RTL ../rtl
}
"""

VIVADO_PREAMBLE_SUBIP = """
# %s
set SRC_%s " \\
"""

VIVADO_PREAMBLE_SUBIP_INCDIRS = """set INC_%s " \\
"""

VIVADO_SUBIP_LIB = "set LIB_%s\n"

VIVADO_POSTAMBLE_SUBIP = """"
"""

VIVADO_ADD_FILES_CMD = "add_files -norecurse -scan_for_includes $SRC_%s\n"

VIVADO_INC_DIRS_PREAMBLE = """set_property include_dirs {
    ../../%s/includes \\
"""

VIVADO_INC_DIRS_CMD = "    ../../%s/%s \\\n"

VIVADO_INC_DIRS_POSTAMBLE = "} [current_fileset] \n"
