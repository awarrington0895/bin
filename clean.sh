#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-10-14 13:52:13
Modified: 2015-10-14 14:00:38
Filename: clean.sh
'
 

# Still needs some work, such as error handling
printf "Are you sure you want to empty the trash bin? (yes/no): "
read answer 
if [ $answer == "yes" ]
	then
		rm -r ~/.trash/* 2>/dev/null
		echo "trash bin successfully emptied"
		exit 0
	else	
		echo "clean aborted"
		exit 0
fi
