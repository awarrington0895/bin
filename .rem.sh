#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-10-14 13:52:13
Modified: 2015-11-19 15:20:02
Filename: .rem.sh
'

# The purpose of this script is for my own safety
# It replaces the natural rm function and instead of permanently deleting
# files, it will send them to a trash folder

# The trash directory can be cleaned using the "clean" command 



if [ $# == 0 ] 
    then
        echo "Usage: trash -l | -p | {filename}*"
    elif [[ "$1" == "-l" ]] 
        then
            if [ -d "$HOME/.trash" ]
                then
                    ls $HOME/.trash
                else
                    echo "There are no files in trash"
            fi
    elif [[ "$1" == "-p" ]]
        then
            if [ -d "$HOME/.trash" ] 
                then
                    rm -r $HOME/.trash
                else
                    echo "Directory $HOME/.trash doesn't exist"
            fi
    else
        for i in $@
            do
                if [ -f "$i" ]
                    then        
                        if [ -d "$HOME/.trash" ]
                            then
                                mv $i $HOME/.trash
                            else
                                mkdir $HOME/.trash
                                mv $i $HOME/.trash
                        fi
                     else
                        echo "File $i doesn't exist"
                fi
        done
                                
        
        
fi
