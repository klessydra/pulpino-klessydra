#!/usr/bin/env python
#
# IPApproX_common.py
# Francesco Conti <f.conti@unibo.it>
#
# Copyright (C) 2015 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

import re, os, subprocess

def prepare(s):
    return re.sub("[^a-zA-Z0-9_]", "_", s)

class tcolors:
    OK      = '\033[92m'
    WARNING = '\033[93m'
    ERROR   = '\033[91m'
    ENDC    = '\033[0m'
    BLUE    = '\033[94m'

def execute(cmd, silent=False):
    with open(os.devnull, "wb") as devnull:
        if silent:
            stdout = devnull
        else:
            stdout = None

        return subprocess.call(cmd.split(), stdout=stdout)

def execute_out(cmd, silent=False):
    p = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE)
    out, err = p.communicate()

    return out

def execute_popen(cmd, silent=False):
    with open(os.devnull, "wb") as devnull:
        if silent:
            return subprocess.Popen(cmd.split(), stdout=subprocess.PIPE, stderr=devnull)
        else:
            return subprocess.Popen(cmd.split(), stdout=subprocess.PIPE)
