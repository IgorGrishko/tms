#!/bin/bash
# TechMeSkill homework from lesson10_22_04_28
# Writen 2022.04.30
# Simple task script 2

folder='myfolder'
files_array=$(ls $folder)
files_count=$(ls $folder | wc -l)
file2='myfolder/file2.txt'

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

# Task 1
log info "$files_count file(s) exists in $folder"

# Task 2
if [[ -e $file2 ]]; then
    chmod 664 $file2 && log info "Permissions for $file2 changed to 664"
else
    log info "$file2 not exist"
fi

# Task 3
for file in $files_array; do
    if [[ ! -s "$folder/$file" ]]; then
        log info "$file is empty"
        rm "$folder/$file" && log info "$file deleted"
    fi
done

# Task 4
files_array=$(ls $folder)
for file in $files_array; do
    if [[ $(cat "$folder/$file" | wc -l) > 1 ]]; then
        sed -i '1!d' "$folder/$file" && log info "String in $file deleted"
    else
        log info "The number of lines in the $file is less than 2"
    fi
done
