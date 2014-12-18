#!/usr/bin/python
# MBED Remounter
# Copyright (C) 2014, Takuo Watanabe
# http://developer.mbed.org/users/takuo/notebook/another-workaround-for-yosemite/
# This software is still in testing phase. Use it at your own risk.
#
# This software is distributed under Apache-2.0 license
# http://opensource.org/licenses/Apache-2.0

import re, subprocess

# The basic idea of the regular expression is by Ned Konz
# http://developer.mbed.org/users/takuo/notebook/another-workaround-for-yosemite/?compage=1#c14828

p = re.compile(r'(/dev/\S+) on (\S*(MBED|NUCLEO).*) \(msdos.*read-only.*\)')
for r in p.finditer(subprocess.check_output('mount')):
    (d, m) = r.group(1,2)
    subprocess.check_call(['umount', d])
    subprocess.check_call(['mkdir', m])
    subprocess.check_call(['mount', '-w', '-o', 'sync', '-t', 'msdos', d, m])

