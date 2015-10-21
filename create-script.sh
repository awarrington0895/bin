#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-10-14 13:52:13
Modified: 2015-10-21 13:45:52
Filename: create-script.sh
'


# This script is used to create other scripts for bash
now=$(date +%Y-%m-%d\ %H:%M:%S)

tag0="Author: Alex Warrington"
tag1="Created: $now"
tag2="Modified: $now" 
 


# Testing number of arguments
if [[ $# -ne 1 ]]
	then
		echo "Incorrect number of arguments"
		echo "Expected 1; Received $#"
		exit 1
fi

filename=$1


# Testing existence of other files with the same filename
if [[ -e "$filename.sh"  ]]
	then
		echo "That file already exists"
		exit 1 
fi

touch $filename

echo "#!/bin/bash" >> $filename

# Entering a tag for the author, date_created, and modify_date
echo " " >> $filename
echo ": '" >> $filename
echo $tag0 >> $filename
echo $tag1 >> $filename
echo $tag2 >> $filename
echo "Filename: $filename.sh" >> $filename
echo "'" >> $filename

chmod +x $filename
mv $filename "$filename.sh"
echo 'alias '$filename'="'$filename.sh'"' >> ~/.bashrc
vim "$filename.sh"
