#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-10-14 13:52:14
Modified: 2015-10-14 14:00:38
Filename: .update.sh
'

# This script should be ran from a crontab or similar utility to be ran every 5-10 minutes


####### SCRIPT REQUIREMENTS ############

# This script assumes that all shell scripts have the file extension '.sh'
# Bash must be 4.0 or above

################# END ##################

# Storing the current modify date written to file and the system's modify date
sys_mod_date="$(stat clean.sh | grep Modify | sed  "s/Modify: \([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} \([0-9]\{2\}:\)\{2\}[0-9]\{2\}\).*/\1/")"
file_mod_date="$(cat clean.sh | grep Modified | sed "s/Modified: \(.*\)/\1/")"

# Takes all files with a .sh ending and writes it to tmp.txt
ls -a | sort | grep '.sh' > tmp.txt
readarray commands < tmp.txt

# For loop that cycles through all the scripts and checks their modify date and changes them if needed (BROKEN)
for file in "${commands[@]}"
do
    if [[ $file_mod_date !=  $sys_mod_date ]]; then
        #sys_mod_date="$(stat $file | grep Modify | sed  "s/Modify: \([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} \([0-9]\{2\}:\)\{2\}[0-9]\{2\}\).*/\1/")"
        #file_mod_date="$(cat $file | grep 'Modified: [0-9]'| sed "s/Modified: \(.*\)/\1/")"
        #sed -i "s/Modified: $file_mod_date/Modified: $sys_mod_date/" $file
        sed -i "s&Modified: $(stat $file | grep Modify | sed  "s/Modify: \([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} \([0-9]\{2\}:\)\{2\}[0-9]\{2\}\).*/\1/")&Modified: $(stat $file | grep Modify | sed  "s/Modify: \([0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\} \([0-9]\{2\}:\)\{2\}[0-9]\{2\}\).*/\1/")&" $file
    fi
done

echo $file_mod_date
echo $sys_mod_date

\rm tmp.txt







