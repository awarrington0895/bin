#!/bin/bash
 
: '
Author: Alex Warrington
Created: 10-05-2015
Last Updated: 10-07-2015
'
# This script gives approximate disk space from the current 
# working directory

du -BM -a $HOME > tmp.txt
echo "Path is: $HOME" > disk_usage.txt
echo "$(date)" >> disk_usage.txt
echo "Size(MB) Location" >> disk_usage.txt
sort -nr tmp.txt  >> disk_usage.txt
sed -i 's/\([0-9][0-9]*\)M/\1/' disk_usage.txt
sed -i 's|\([0-9][0-9]*.*\)/home/students/awarring|\1.|' disk_usage.txt
\rm tmp.txt
head -n 13 disk_usage.txt
