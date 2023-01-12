#!/bin/bash
# TechMeSkill homework from lesson10_22_04_28
# Writen 2022.04.30
# Simple task script 1

folder='myfolder'
file1="$folder/file1.txt"
file2="$folder/file2.txt"
file3="$folder/file3.txt"
file4="$folder/file4.txt"
file5="$folder/file5.txt"

# func log print
log(){
    case $1 in
    "err")
        echo -e "\033[1;31mERR: $2\033[0m" >> /dev/stderr
    ;;
    'info')
        echo -e "\033[1;32mINFO: $2\033[0m" >> /dev/stdout
    ;;
esac
}

# Check folder exist
if [[ -e $folder ]]; then
    if [[ -d $folder ]]; then
        log info "$folder is exist" 
    else
        log err "$folder is a file"
        exit 1
    fi
else
    mkdir $folder && log info "$folder created" 
fi

# Task 1
touch $file1
echo "Hello World!!!" > $file1
date >> $file1
log info "$file1 created" 

# Task 2
touch $file2 && log info "$file2 created" 
chmod 777 $file2 && log info "Permissions for $file2 changed to 777" 

# Task 3
touch $file3
string=$(echo $RANDOM | md5sum | head -c 20)
echo "$string" > $file3
log info "$file3 created" 

# Task 4-5
for file in $file4 $file5; do
    touch $file
    log info "$file created"
done
