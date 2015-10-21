#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-10-14 13:52:14
Modified: 2015-10-21 16:05:58
Filename: .update.sh
'

# This script should be ran from a crontab or similar utility to be ran every 5-10 minutes


####### SCRIPT REQUIREMENTS ############

# This script assumes that all shell scripts have the file extension '.sh'
# Bash must be 4.0 or above
# All shell scripts located in ~/bin

################# END ##################


# Takes all files with a .sh ending and writes it to tmp.txt
ls -a $HOME/bin | sort | grep '.sh' > tmp.txt
readarray commands < tmp.txt

# For loop that cycles through all the scripts and checks their modify date and changes them if needed 
for file in "${commands[@]}"
do
    
    sys_mod_date="$(date --reference=$HOME/bin/$file +"%Y-%m-%d %H:%M:%S")"
    file_mod_date="$(cat $HOME/bin/$file | grep "Modified: [0-9]" | sed "s|Modified: \(.*\)|\1|")"
    if [[ $file_mod_date !=  $sys_mod_date ]]; then
          sed -i "s|\(Modified:\) [0-9].*|\1 $sys_mod_date|" $HOME/bin/$file
          touch -m -d "$sys_mod_date" $file
    fi

done



\rm tmp.txt







