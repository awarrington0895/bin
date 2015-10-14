#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-10-14 13:52:13
Modified: 2015-10-14 14:00:38
Filename: cpu_util.sh
'

# This script finds the top ten running processes
# and sends them to a file called top_cpu_out.txt 
# in the current working directory.


ps aux | head -1 > top_cpu_out.txt
ps aux | sort -k3nr | head -10 >> top_cpu_out.txt 

exit 0

