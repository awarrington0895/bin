#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-10-14 13:52:13
Modified: 2015-10-15 15:34:17
Filename: sp.sh
'

# Will this count?

# This script gives approximate disk space used in the home directory

#  Uses a temp. txt file to avoid sorting the path, date, and category line along with the other entries
#  Prints disk usage in megabytes
du -BM -a $HOME > tmp.txt

# Prints the path, date, and category line
echo "Path is: $HOME" > disk_usage.txt
echo "$(date)" >> disk_usage.txt
echo "Size(MB) Location" >> disk_usage.txt

# Sorts disk_usage.txt in ascending order according to size
sort -nr tmp.txt  >> disk_usage.txt

# These two sed statements swap out the ~ path for . and removes the M from the MB count
sed -i 's/\([0-9][0-9]*\)M/\1/' disk_usage.txt
sed -i "s|\([0-9][0-9]*.*\)$HOME|\1.|" disk_usage.txt

\rm tmp.txt

# Printing out first 10 entries along with the three beginning lines
head -n 13 disk_usage.txt
exit 0
