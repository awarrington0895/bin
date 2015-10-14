#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-10-14 13:52:13
Modified: 2015-10-14 14:00:38
Filename: .clean_trash.sh
'



rm /home/students/awarring/.trash/* 

if [[ $? -eq 0 ]]; 
    then
        echo "Trash cleaned successfully"
        exit 0
    else
        echo "Trash couldn't be cleaned"
        exit 1
fi
