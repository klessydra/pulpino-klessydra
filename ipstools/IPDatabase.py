#!/usr/bin/env python
#
# IPDatabase.py
# Francesco Conti <f.conti@unibo.it>
#
# Copyright (C) 2015 ETH Zurich, University of Bologna
# All rights reserved.
#
# This software may be modified and distributed under the terms
# of the BSD license.  See the LICENSE file for details.
#

# YAML workaround
import sys,os,stat
sys.path.append(os.path.abspath("yaml/lib64/python"))
import yaml
import re
try:
    from collections import OrderedDict
except ImportError:
    from ordereddict import OrderedDict
from .IPConfig import *
from .IPApproX_common import *
from .vivado_defines import *
from .ips_defines import *
from .synopsys_defines import *
from .verilator_defines import *

LEGACY_IPS = [
    'cea'
]

def ordered_load(stream, Loader=yaml.Loader, object_pairs_hook=OrderedDict):
    class OrderedLoader(Loader):
        pass
    def construct_mapping(loader, node):
        loader.flatten_mapping(node)
        return object_pairs_hook(loader.construct_pairs(node))
    OrderedLoader.add_constructor(
        yaml.resolver.BaseResolver.DEFAULT_MAPPING_TAG,
        construct_mapping)
    return yaml.load(stream, OrderedLoader)

def load_ips_list(filename):
    # get a list of all IPs that we are interested in from ips_list.yml
    with open(filename, "rb") as f:
        ips_list = ordered_load(f, yaml.SafeLoader)
    ips = []
    for i in ips_list.keys():
        commit = ips_list[i]['commit']
        try:
            domain = ips_list[i]['domain']
        except KeyError:
            domain = None
        try:
            group = ips_list[i]['group']
        except KeyError:
            group = None
        path = i
        name = i.split()[0].split('/')[-1]
        try:
            alternatives = list(set.union(set(ips_list[i]['alternatives']), set([name])))
        except KeyError:
            alternatives = None
        ips.append({'name': name, 'commit': commit, 'group': group, 'path': path, 'domain': domain, 'alternatives': alternatives })
    return ips

def store_ips_list(filename, ips):
    ips_list = {}
    for i in ips:
        if i['alternatives'] != None:
            ips_list[i['path']] = {'commit': i['commit'], 'group': i['group'], 'domain': i['domain'], 'alternatives': i['alternatives']}
        else:
            ips_list[i['path']] = {'commit': i['commit'], 'group': i['group'], 'domain': i['domain']}
    with open(filename, "wb") as f:
        f.write(IPS_LIST_PREAMBLE)
        f.write(yaml.dump(ips_list))

class IPDatabase(object):
    rtl_dir  = "./fe/rtl"
    ips_dir  = "./fe/ips"
    vsim_dir = "./fe/sim"

    def __init__(self, ips_list_path=".", ips_dir="./fe/ips", rtl_dir="./fe/rtl", vsim_dir="./fe/sim", skip_scripts=False):
        super(IPDatabase, self).__init__()
        self.ips_dir = ips_dir
        self.rtl_dir = rtl_dir
        self.vsim_dir = vsim_dir
        self.ip_dic = {}
        ips_list_yml = "%s/ips_list.yml" % (ips_list_path)
        self.ip_list = load_ips_list(ips_list_yml)
        if not skip_scripts:
            for ip in self.ip_list:
                ip_full_name = ip['name']
                ip_full_path = "%s/%s/%s/src_files.yml" % (ips_list_path, ips_dir, ip['path'])
                self.import_yaml(ip_full_name, ip_full_path, ip['path'], domain=ip['domain'], alternatives=ip['alternatives'])
            sub_ip_check_list = []
            for i in self.ip_dic.keys():
                sub_ip_check_list.extend(self.ip_dic[i].sub_ips.keys())
            if len(set(sub_ip_check_list)) != len(sub_ip_check_list):
                print(tcolors.WARNING + "WARNING: two sub-IPs have the same name. This can cause trouble!" + tcolors.ENDC)
                import collections
                blacklist = [item for item, count in collections.Counter(sub_ip_check_list).items() if count > 1]
                for el in blacklist:
                    print(tcolors.WARNING + "  %s" % el + tcolors.ENDC)

    def import_yaml(self, ip_name, filename, ip_path, domain=None, alternatives=None):
        if not os.path.exists(os.path.dirname(filename)):
            print(tcolors.ERROR + "ERROR: ip '%s' has not src_files.yml file. File path: %s" % (ip_name, filename) + tcolors.ENDC)
            sys.exit(1)
        try:
            with open(filename, "rb") as f:
                ip_dic = ordered_load(f, yaml.SafeLoader)
        except IOError:
            print(tcolors.WARNING + "WARNING: Skipped ip '%s' as it has no src_files.yml file." % ip_name + tcolors.ENDC)
            return

        try:
            self.ip_dic[ip_name] = IPConfig(ip_name, ip_dic, ip_path, self.ips_dir, self.vsim_dir, domain=domain, alternatives=alternatives)
        except KeyError:
            print(tcolors.WARNING + "WARNING: Skipped ip '%s' with %s config file as it seems it is already in the ip database." % (ip_name, filename) + tcolors.ENDC)

    def diff_ips(self):
        prepend = "  "
        ips = self.ip_list
        cwd = os.getcwd()
        unstaged_ips = []
        staged_ips = []
        for ip in ips:
            try:
                os.chdir("%s/%s" % (self.ips_dir, ip['path']))
                output, err = execute_popen("git diff --name-only").communicate()
                unstaged_out = ""
                if output.split("\n")[0] != "":
                    for line in output.split("\n"):
                        l = line.split()
                        try:
                            unstaged_out += "%s%s\n" % (prepend, l[0])
                        except IndexError:
                            break
                output, err = execute_popen("git diff --cached --name-only").communicate()
                staged_out = ""
                if output.split("\n")[0] != "":
                    for line in output.split("\n"):
                        l = line.split()
                        try:
                            staged_out += "%s%s\n" % (prepend, l[0])
                        except IndexError:
                            break
                os.chdir(cwd)
                if unstaged_out != "":
                    print("Changes not staged for commit in ip " + tcolors.WARNING + "'%s'" % ip['name'] + tcolors.ENDC + ".")
                    print(unstaged_out)
                    unstaged_ips.append(ip)
                if staged_out != "":
                    print("Changes staged for commit in ip " + tcolors.WARNING + "'%s'" % ip['name'] + tcolors.ENDC + ".\nUse " + tcolors.BLUE + "git reset HEAD" + tcolors.ENDC + " in the ip directory to unstage.")
                    print(staged_out)
                    staged_ips.append(ip)
            except OSError:
                print(tcolors.WARNING + "WARNING: Skipping ip '%s'" % ip['name'] + " as it doesn't exist." + tcolors.ENDC)
        return (unstaged_ips, staged_ips)

    def remove_ips(self, skip_check=False):
        ips = self.ip_list
        cwd = os.getcwd()
        unstaged_ips, staged_ips = self.diff_ips()
        os.chdir(self.ips_dir)
        if not skip_check and (len(unstaged_ips)+len(staged_ips) > 0):
            print(tcolors.ERROR + "ERROR: Cowardly refusing to remove IPs as there are changes." + tcolors.ENDC)
            print("If you *really* want to remove ips, run remove-ips.py with the --skip-check flag.")
            sys.exit(1)
        for ip in ips:
            import shutil
            for root, dirs, files in os.walk('%s' % ip['path']):
                for f in files:
                    os.unlink(os.path.join(root, f))
                for d in dirs:
                    shutil.rmtree(os.path.join(root, d))
            try:
                os.removedirs("%s" % ip['path'])
            except OSError:
                pass
        print(tcolors.OK + "Removed all IPs listed in ips_list.yml." + tcolors.ENDC)
        os.chdir(cwd)
        try:
            os.removedirs(self.ips_dir)
        except OSError:
            print(tcolors.WARNING + "WARNING: Not removing %s as there are unknown IPs there." % (self.ips_dir) + tcolors.ENDC)

    def update_ips(self, remote = "git@iis-git.ee.ethz.ch:pulp-project"):
        errors = []
        ips = self.ip_list
        git = "git"
        # make sure we are in the correct directory to start
        owd = os.getcwd()
        os.chdir(self.ips_dir)
        cwd = os.getcwd()

        server = None
        group = None
        # try to strip group from remote
        [server, group] = remote.rsplit(":", 1)

        for ip in ips:
            os.chdir(cwd)
            # check if directory already exists, this hints to the fact that we probably already cloned it
            if os.path.isdir("./%s" % ip['path']):
                os.chdir("./%s" % ip['path'])

                # now check if the directory is a git directory
                if ip['path'] != "apb/apb_node" and \
                   ip['path'] != "apb/apb_event_unit" and \
                   ip['path'] != "apb/apb_fll_if" and \
                   ip['path'] != "apb/apb_gpio" and \
                   ip['path'] != "apb/apb_i2c" and \
                   ip['path'] != "apb/apb_pulpino" and \
                   ip['path'] != "apb/apb_spi_master" and \
                   ip['path'] != "apb/apb_timer" and \
                   ip['path'] != "apb/apb_timer" and \
                   ip['path'] != "apb/apb_uart" and \
                   ip['path'] != "apb/apb_uart_sv" and \
                   ip['path'] != "apb/apb2per" and \
                   ip['path'] != "axi/axi2apb" and \
                   ip['path'] != "axi/axi_mem_if_DP" and \
                   ip['path'] != "axi/axi_node" and \
                   ip['path'] != "axi/axi_slice" and \
                   ip['path'] != "axi/axi_slice_dc" and \
                   ip['path'] != "axi/axi_spi_master" and \
                   ip['path'] != "axi/axi_spi_slave" and \
                   ip['path'] != "axi/core2axi" and \
                   ip['path'] != "adv_dbg_if" and \
                   ip['path'] != "fpu" and \
                   ip['path'] != "riscv" and \
                   ip['path'] != "zero-riscy":
                    if not os.path.isdir(".git"):
                        print(tcolors.ERROR + "ERROR: Found a normal directory instead of a git directory at %s. You may have to delete this folder to make this script work again" % os.getcwd() + tcolors.ENDC)
                        errors.append("%s - %s: Not a git directory" % (ip['name'], ip['path']));
                        continue

                    print(tcolors.OK + "\nUpdating ip '%s'..." % ip['name'] + tcolors.ENDC)

                    # fetch everything first so that all commits are available later
                    ret = execute("%s fetch" % (git))
                    if ret != 0:
                        print(tcolors.ERROR + "ERROR: could not fetch ip '%s'." % (ip['name']) + tcolors.ENDC)
                        errors.append("%s - Could not fetch" % (ip['name']));
                        continue

                    ret = execute("%s checkout %s" % (git, ip['commit']))
                    if ret != 0:
                        print(tcolors.ERROR + "ERROR: could not checkout ip '%s' at %s." % (ip['name'], ip['commit']) + tcolors.ENDC)
                        errors.append("%s - Could not checkout commit %s" % (ip['name'], ip['commit']));
                        continue

                    # check if we are in detached HEAD mode
                    stdout = execute_out("%s status" % git)

                    if not ("HEAD detached" in stdout):
                        # only do the pull if we are not in detached head mode
                        ret = execute("%s pull --ff-only" % git)
                        if ret != 0:
                            print(tcolors.ERROR + "ERROR: could not update ip '%s'" % ip['name'] + tcolors.ENDC)
                            errors.append("%s - Could not update" % (ip['name']));
                            continue

            # Not yet cloned, so we have to do that first
            else:
                os.chdir("./")

                print(tcolors.OK + "\nCloning ip '%s'..." % ip['name'] + tcolors.ENDC)

                if group and ip['group']:
                    ip['remote'] = "%s:%s" % (server, ip['group'])
                else:
                    ip['remote'] = remote

                print(ip['remote'])

                ret = execute("%s clone %s/%s.git %s" % (git, ip['remote'], ip['name'], ip['path']))
                if ret != 0:
                    print(tcolors.ERROR + "ERROR: could not clone, you probably have to remove the '%s' directory." % ip['name'] + tcolors.ENDC)
                    errors.append("%s - Could not clone" % (ip['name']));
                    continue
                os.chdir("./%s" % ip['path'])
                ret = execute("%s checkout %s" % (git, ip['commit']))
                if ret != 0:
                    print(tcolors.ERROR + "ERROR: could not checkout ip '%s' at %s." % (ip['name'], ip['commit']) + tcolors.ENDC)
                    errors.append("%s - Could not checkout commit %s" % (ip['name'], ip['commit']));
                    continue
        os.chdir(cwd)
        print('\n\n')
        print(tcolors.WARNING + "SUMMARY" + tcolors.ENDC)
        if len(errors) == 0:
            print(tcolors.OK + "IPs updated successfully!" + tcolors.ENDC)
        else:
            for error in errors:
                print(tcolors.ERROR + '    %s' % (error) + tcolors.ENDC)
            print()
            print(tcolors.ERROR + "ERRORS during IP update!" + tcolors.ENDC)
            sys.exit(1)
        os.chdir(owd)

    def delete_tag_ips(self, tag_name):
        cwd = os.getcwd()
        ips = self.ip_list
        new_ips = []
        for ip in ips:
            os.chdir("%s/%s" % (self.ips_dir, ip['path']))
            ret = execute("git tag -d %s" % tag_name)
            os.chdir(cwd)

    def push_tag_ips(self, tag_name=None):
        cwd = os.getcwd()
        ips = self.ip_list
        new_ips = []
        for ip in ips:
            os.chdir("%s/%s" % (self.ips_dir, ip['path']))
            if tag_name == None:
                newest_tag = execute_popen("git describe --tags --abbrev=0", silent=True).communicate()
                try:
                    newest_tag = newest_tag[0].split()
                    newest_tag = newest_tag[0]
                except IndexError:
                    pass
            else:
                newest_tag = tag_name
            ret = execute("git push origin tags/%s" % newest_tag)
            os.chdir(cwd)

    def push_ips(self, remote_name, remote):
        cwd = os.getcwd()
        ips = self.ip_list
        new_ips = []
        for ip in ips:
            os.chdir("%s/%s" % (self.ips_dir, ip['path']))
            ret = execute("git remote add %s %s/%s.git" % (remote_name, remote, ip['name']))
            ret = execute("git push %s master" % remote_name)
            os.chdir(cwd)

    def tag_ips(self, tag_name, changes_severity='warning', tag_always=False):
        cwd = os.getcwd()
        ips = self.ip_list
        new_ips = []
        for ip in ips:
            os.chdir("%s/%s" % (self.ips_dir, ip['path']))
            newest_tag, err = execute_popen("git describe --tags --abbrev=0", silent=True).communicate()
            unstaged_changes, err = execute_popen("git diff --name-only").communicate()
            staged_changes, err = execute_popen("git diff --name-only").communicate()
            if staged_changes.split("\n")[0] != "":
                if changes_severity == 'warning':
                    print(tcolors.WARNING + "WARNING: skipping ip '%s' as it has changes staged for commit." % ip['name'] + tcolors.ENDC + "\nSolve, commit and " + tcolors.BLUE + "git tag %s" % tag_name + tcolors.ENDC + " manually.")
                    os.chdir(cwd)
                    continue
                else:
                    print(tcolors.ERROR + "ERROR: ip '%s' has changes staged for commit." % ip['name'] + tcolors.ENDC + "\nSolve and commit before trying to auto-tag.")
                    sys.exit(1)
            if unstaged_changes.split("\n")[0] != "":
                if changes_severity == 'warning':
                    print(tcolors.WARNING + "WARNING: skipping ip '%s' as it has unstaged changes." % ip['name'] + tcolors.ENDC + "\nSolve, commit and " + tcolors.BLUE + "git tag %s" % tag_name + tcolors.ENDC + " manually.")
                    os.chdir(cwd)
                    continue
                else:
                    print(tcolors.ERROR + "ERROR: ip '%s' has unstaged changes." % ip['name'] + tcolors.ENDC + "\nSolve and commit before trying to auto-tag.")
                    sys.exit(1)
            if newest_tag != "":
                output, err = execute_popen("git diff --name-only tags/%s" % newest_tag).communicate()
            else:
                output = ""
            if output.split("\n")[0] != "" or newest_tag=="" or tag_always:
                ret = execute("git tag %s" % tag_name)
                if ret != 0:
                    print(tcolors.WARNING + "WARNING: could not tag ip '%s', probably the tag already exists." % (ip['name']) + tcolors.ENDC)
                else:
                    print("Tagged ip " + tcolors.WARNING + "'%s'" % ip['name'] + tcolors.ENDC + " with tag %s." % tag_name)
                newest_tag = tag_name
            try:
                newest_tag = newest_tag.split()[0]
            except IndexError:
                pass
            new_ips.append({'name': ip['name'], 'path': ip['path'], 'domain': ip['domain'], 'alternatives': ip['alternatives'], 'group': ip['group'], 'commit': "tags/%s" % newest_tag})
            os.chdir(cwd)

        store_ips_list("new_ips_list.yml", new_ips)

    def get_latest_ips(self, changes_severity='warning', tag_always=False):
        cwd = os.getcwd()
        ips = self.ip_list
        new_ips = []
        for ip in ips:
            os.chdir("%s/%s" % (self.ips_dir, ip['path']))
            commit, err = execute_popen("git log -n 1 --format=format:%H", silent=True).communicate()
            unstaged_changes, err = execute_popen("git diff --name-only").communicate()
            staged_changes, err = execute_popen("git diff --name-only").communicate()
            if staged_changes.split("\n")[0] != "":
                if changes_severity == 'warning':
                    print(tcolors.WARNING + "WARNING: skipping ip '%s' as it has changes staged for commit." % ip['name'] + tcolors.ENDC + "\nSolve and commit manually.")
                    os.chdir(cwd)
                    continue
                else:
                    print(tcolors.ERROR + "ERROR: ip '%s' has changes staged for commit." % ip['name'] + tcolors.ENDC + "\nSolve and commit before trying to get latest version.")
                    sys.exit(1)
            if unstaged_changes.split("\n")[0] != "":
                if changes_severity == 'warning':
                    print(tcolors.WARNING + "WARNING: skipping ip '%s' as it has unstaged changes." % ip['name'] + tcolors.ENDC + "\nSolve and commit manually.")
                    os.chdir(cwd)
                    continue
                else:
                    print(tcolors.ERROR + "ERROR: ip '%s' has unstaged changes." % ip['name'] + tcolors.ENDC + "\nSolve and commit before trying to get latest version.")
                    sys.exit(1)
            new_ips.append({'name': ip['name'], 'path': ip['path'], 'domain': ip['domain'], 'alternatives': ip['alternatives'], 'group': ip['group'], 'commit': "%s" % commit})
            os.chdir(cwd)

        store_ips_list("new_ips_list.yml", new_ips)

    def export_make(self, abs_path="$(IP_PATH)", script_path="./", more_opts="", target_tech='st28fdsoi'):
        for i in self.ip_dic.keys():
            filename = "%s/%s.mk" % (script_path, i)
            makefile = self.ip_dic[i].export_make(abs_path, more_opts, target_tech=target_tech)
            with open(filename, "wb") as f:
                f.write(makefile)

    def export_vsim(self, abs_path="${IP_PATH}", script_path="./", more_opts="", target_tech='st28fdsoi'):
        for i in self.ip_dic.keys():
            filename = "%s/vcompile_%s.csh" % (script_path, i)
            vcompile_script = self.ip_dic[i].export_vsim(abs_path, more_opts, target_tech=target_tech)
            with open(filename, "wb") as f:
                f.write(vcompile_script)
                os.fchmod(f.fileno(), os.fstat(f.fileno()).st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)

    def export_synopsys(self, script_path=".", target_tech='st28fdsoi', domain=None):
        for i in self.ip_dic.keys():
            if domain==None or domain in self.ip_dic[i].domain:
                filename = "%s/analyze_%s.tcl" % (script_path, i)
                analyze_script = self.ip_dic[i].export_synopsys(target_tech=target_tech)
                with open(filename, "wb") as f:
                    f.write(analyze_script)

    def export_vivado(self, abs_path="$IPS", script_path="./src_files.tcl", domain=None, alternatives=[]):
        filename = "%s" % (script_path)
        vivado_script = VIVADO_PREAMBLE % (self.ips_dir)
        for i in self.ip_dic.keys():
            if self.ip_dic[i].alternatives==None or set.intersection(set([self.ip_dic[i].ip_name]), set(alternatives), set(self.ip_dic[i].alternatives))!=set([]):
                if domain==None or domain in self.ip_dic[i].domain:
                    vivado_script += self.ip_dic[i].export_vivado(abs_path)
        with open(filename, "wb") as f:
            f.write(vivado_script)

    def export_synplify(self, abs_path="$IPS", script_path="./src_files_synplify.tcl"):
        filename = "%s" % (script_path)
        synplify_script = ""
        for i in self.ip_dic.keys():
            synplify_script += self.ip_dic[i].export_synplify(abs_path)
        with open(filename, "wb") as f:
            f.write(synplify_script)

    def export_verilator(self, abs_path="${TOP_PATH}/ips", script_path="./", more_opts=""):
            filename = "%s" % (script_path)
            verilator_script = VERILATOR_PREAMBLE
            # generate include dirs
            verilator_includes = ""
            for i in self.ip_dic.keys():
                verilator_includes += self.ip_dic[i].generate_verilator_inc_dirs(abs_path) + " "
            verilator_script += VERILATOR_INCLUDES % verilator_includes
            verilator_script += VERILATOR_COMMAND % more_opts
            with open(filename, "wb") as f:
                f.write(verilator_script)
                os.fchmod(f.fileno(), os.fstat(f.fileno()).st_mode | stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH)

    def generate_vsim_tcl(self, filename):
        l = []
        for i in self.ip_dic.keys():
            l.append(i)
        vsim_tcl = VSIM_TCL_PREAMBLE
        for el in l:
            if not self.ip_dic[el].ip_name in LEGACY_IPS:
                vsim_tcl += VSIM_TCL_CMD % prepare(el)
        vsim_tcl += VSIM_TCL_POSTAMBLE
        with open(filename, "wb") as f:
            f.write(vsim_tcl)

    def generate_makefile(self, filename, target_tech=None):
        l = []
        for i in self.ip_dic.keys():
            l.append(i)
        vcompile_libs = MK_LIBS_PREAMBLE
        if target_tech != "xilinx":
            for el in l:
                vcompile_libs += MK_LIBS_CMD % (self.vsim_dir, el, "build")
        # else:
        #     for el in l:
        #         vcompile_libs += MK_LIBS_XILINX_CMD % el
        vcompile_libs += "\n"
        vcompile_libs += MK_LIBS_LIB
        if target_tech != "xilinx":
            for el in l:
                vcompile_libs += MK_LIBS_CMD % (self.vsim_dir, el, "lib")
        # else:
        #     for el in l:
        #         vcompile_libs += MK_LIBS_XILINX_CMD % el
        vcompile_libs += "\n"
        vcompile_libs += MK_LIBS_CLEAN
        if target_tech != "xilinx":
            for el in l:
                vcompile_libs += MK_LIBS_CMD % (self.vsim_dir, el, "clean")
        # else:
        #     for el in l:
        #         vcompile_libs += MK_LIBS_XILINX_CMD % el
        vcompile_libs += "\n"
        with open(filename, "wb") as f:
            f.write(vcompile_libs)

    def generate_vcompile_libs_csh(self, filename, target_tech=None):
        l = []
        for i in self.ip_dic.keys():
            l.append(i)
        vcompile_libs = VCOMPILE_LIBS_PREAMBLE
        if target_tech != "xilinx":
            for el in l:
                vcompile_libs += VCOMPILE_LIBS_CMD % (self.vsim_dir, el)
        else:
            for el in l:
                vcompile_libs += VCOMPILE_LIBS_XILINX_CMD % el
        with open(filename, "wb") as f:
            f.write(vcompile_libs)

    def generate_vivado_add_files(self, filename, domain=None, alternatives=[]):
        l = []
        vivado_add_files_cmd = ""
        for i in self.ip_dic.keys():
            if self.ip_dic[i].alternatives==None or set.intersection(set([self.ip_dic[i].ip_name]), set(alternatives), set(self.ip_dic[i].alternatives))!=set([]):
                if domain==None or domain in self.ip_dic[i].domain:
                    l.extend(self.ip_dic[i].generate_vivado_add_files())
        for el in l:
            vivado_add_files_cmd += VIVADO_ADD_FILES_CMD % el.upper()
        with open(filename, "wb") as f:
            f.write(vivado_add_files_cmd)

    def generate_vivado_inc_dirs(self, filename, domain=None, alternatives=[]):
        l = []
        vivado_inc_dirs = VIVADO_INC_DIRS_PREAMBLE % (self.rtl_dir)
        for i in self.ip_dic.keys():
            if self.ip_dic[i].alternatives==None or set.intersection(set([self.ip_dic[i].ip_name]), set(alternatives), set(self.ip_dic[i].alternatives))!=set([]):
                if domain==None or domain in self.ip_dic[i].domain:
                    incdirs = []
                    path = self.ip_dic[i].ip_path
                    for j in self.ip_dic[i].generate_vivado_inc_dirs():
                        incdirs.append("%s/%s" % (path, j))
                    l.extend(incdirs)
        for el in l:
            vivado_inc_dirs += VIVADO_INC_DIRS_CMD % (self.ips_dir, el)
        vivado_inc_dirs += VIVADO_INC_DIRS_POSTAMBLE
        with open(filename, "wb") as f:
            f.write(vivado_inc_dirs)
