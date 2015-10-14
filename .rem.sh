#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-10-14 13:52:13
Modified: 2015-10-14 14:00:38
Filename: .rem.sh
'

# The purpose of this script is for my own safety
# It replaces the natural rm function and instead of permanently deleting
# files, it will send them to a trash folder

# The trash directory can be cleaned using the "clean" command 

mv $1 ~/.trash

