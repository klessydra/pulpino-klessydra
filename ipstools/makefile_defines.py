#!/usr/bin/env python
#
# vsim_defines.py
# Francesco Conti <f.conti@unibo.it>
#
# Copyright (C) 2015 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

# templates for ip.mk scripts
MK_PREAMBLE = """#
# Copyright (C) 2016 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

IP=%s
IP_PATH=$(IPS_PATH)/%s
LIB_NAME=$(IP)_lib

include vcompile/build.mk

vcompile-$(IP): $(LIB_PATH)"""

MK_POSTAMBLE = """\n\t$(ip_echo)

"""

MK_IPRULE_CMD = "\\\n\tvcompile-subip-%s"

MK_SUBIPSRC = """SRC_SVLOG_%s=%s
SRC_VHDL_%s=%s
"""

MK_SUBIPINC = """# %s component
INCDIR_%s=%s
"""

MK_SUBIPRULE = """vcompile-subip-%s: $(SRC_SVLOG_%s) $(SRC_VHDL_%s)
	$(call subip_echo,%s)
	%s
"""

MK_BUILDCMD_SVLOG = "$(SVLOG_CC) -work $(LIB_PATH) %s $(INCDIR_%s) $(SRC_SVLOG_%s)"
MK_BUILDCMD_VLOG  = "$(VLOG_CC) -work $(LIB_PATH) %s $(INCDIR_%s) $(SRC_%s)"
MK_BUILDCMD_VHDL  = "$(VHDL_CC) -work $(LIB_PATH) %s $(SRC_VHDL_%s)"

# templates for general Makefile
MK_LIBS_PREAMBLE = """#
# Copyright (C) 2016 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

PULP_PATH?=..

build:"""

MK_LIBS_CLEAN = "\nclean:"
MK_LIBS_LIB = "\nlib:"

MK_LIBS_CMD = "\n\t@make --no-print-directory -f $(PULP_PATH)/%s/vcompile/ips/%s.mk %s"
