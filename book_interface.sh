#!/bin/bash
 
: '
Author: Alex Warrington
Created: 2015-11-30 18:44:51
Modified: 2015-12-01 14:02:01
Filename: book_interface.sh.sh
'

# Prints the interface menu#{{{
function printMenu() {
    echo "What would you like to do?"
    echo "1) Add entry"
    echo "2) Delete entry"
    echo "3) List the phonebook in alphabetical order"
    echo "4) Find entry" 
    echo "5) Print the menu"
    echo "6) Exit"
} #}}}

clear

printf "Starting up the phonebook...\n"
sleep 1

# If the phonebook doesn't exist, it echoes the file usage
if [ ! -f .phonebook.csv ]; then
    echo "Name:Address:Phone Number" > .phonebook.csv
fi

printMenu

printf "#? "
read input

# Loops through the menu options#{{{
while [[ $input != 6 ]]
do  
    # Asks user for name address and phone number, then adds it to the phone book#{{{
    if [[ $input == 1 ]]; then
        printf "Enter name: "
        read addName
        printf "Enter address: "
        read address
        printf "Enter phone number: "
        read phoneNumber
        printf "$addName:$address:$phoneNumber\n" >> .phonebook.csv#}}}
    

    # Searches for a specific entry by name and deletes it#{{{
    elif [[ $input == 2 ]]; then
        printf "Input the name of the entry you want to delete: "
        read deleteName
        awk -F: --assign name="$deleteName" '$1 ~ name' .phonebook.csv > possibleRecords.tmp

        # Checks how many records the awk statement returned
        lineNumber=`cat possibleRecords.tmp | wc -l`
        
        # If the awk statement returned more than one record it prompts for part of the address to delete
        if [[ $lineNumber > 1 ]]; then
            clear
            echo "More than one record was found!"
            echo " "
            awk -F: '{printf "%s:%s\n",NR,$0}' possibleRecords.tmp | tee records.tmp 
            echo " "
            echo "The first field is the record number"
            printf "Enter the record number you want to delete: "
            read recordNum
            recordToDelete=`awk --assign record="$recordNum" -F: '$1 ~ record{printf "%s:%s:%s",$2,$3,$4}' records.tmp`
            sed -i "s|^$recordToDelete$||g" .phonebook.csv
            sed -i '/^$/d' .phonebook.csv

            rm possibleRecords.tmp records.tmp 
        # Otherwise it deletes the record that was found
        else
            awk --assign name="$deleteName" -F: '$1 !~ name{print}' .phonebook.csv >> .phonebook.csv.swp
            cat .phonebook.csv.swp > .phonebook.csv
            rm .phonebook.csv.swp
        fi#}}}
            

    # Lists the phone book in alphabetical order#{{{
    elif [[ $input == 3 ]]; then
        clear
        awk '{if (NR!=1) {print}}' .phonebook.csv | sort
        echo " "
        printMenu#}}}


    # Finds a specific entry by name #{{{
    elif [[ $input == 4 ]]; then
        printf "What is the name of the entry you are searching for: "        
        read searchName
        
        # Prints all records that match the search string
        awk -F: --assign name="$searchName" '$1 ~ name{print}' .phonebook.csv#}}}


    # Prints Menu#{{{
    elif [[ $input == 5 ]]; then
        printMenu
#}}}

    else
        echo "Unrecognized menu option"
    fi
    printf "#? "
    read input
done #}}}
