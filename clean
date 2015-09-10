#!/bin/bash

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
