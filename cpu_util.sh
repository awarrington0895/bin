#!/bin/bash

# This script finds the top ten running processes
# and sends them to a file called top_cpu_out.txt 
# in the current working directory.


ps aux | head -1 > top_cpu_out.txt
ps aux | sort -k3nr | head -10 >> top_cpu_out.txt 

exit 0

