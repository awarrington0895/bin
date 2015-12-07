#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-10-14 13:52:13
Modified: 2015-12-03 13:43:02
Filename: .rem.sh
'

# The purpose of this script is for my own safety
# It replaces the natural rm function and instead of permanently deleting
# files, it will send them to a trash folder





if [ $# == 0 ] 
    then
        echo "Usage: rm -l | -d | {filename}*"
    elif [[ "$1" == "-l" || "$1" == "--list" ]]; then
        if [[ -e $HOME/.trash ]]; then
            ls $HOME/.trash
        else
            echo "Trash is empty"
        fi 
    elif [[ "$1" == "-d" ]]
        then
            if [ -e "$HOME/.trash" ] 
                then
                    rm -r $HOME/.trash
                    echo "Trash successfully emptied"
                else
                    echo "Trash is already empty"
            fi

    # Shreds all files in the trash then deletes the trash
    elif [[ "$1" == "-s" || "$1" == "--shred" ]]; then
        if [[ -e $HOME/.trash ]]; then
            ls $HOME/.trash > trash_files.tmp
            readarray files < trash_files.tmp

            for file in "${files[@]}"; do
                shred $HOME/.trash/$file
            done

            rm -r $HOME/.trash
            rm trash_files.tmp
        else
            echo "Trash is already empty"
        fi

        

        
    else
        for i in $@
            do
                if [ -e "$i" ]
                    then        
                        if [ -e "$HOME/.trash" ]
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
