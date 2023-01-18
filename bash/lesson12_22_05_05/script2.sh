#!/bin/bash
# TechMeSkill homework from lesson12_22_05_05
# Writen 2022.05.11
# Script to print directory content

# Print line
printLine(){
    echo "---------------------------------------------------------------------------------"
}

# Directory info
curentDir(){
    echo -e "Your curent location is $(pwd)\nAvailible directories are:\n\n$(ls -d */)\n"
    echo -e -n "Press 'y' to start from here or enter the directory name. [ y / directory name ]: "
}

# Using find command
findFile(){
    find "$opt1"/ \( ! -regex '.*/\..*' \) -type f | tee /tmp/hw2.tmp
    if [ ! -s "$(ls -A /tmp/hw2.tmp)" ]; then
        echo "Directory $opt1 is empty"
    fi
    rm /tmp/hw2.tmp
}

printLine
echo "Welcome to print directory script"
printLine
curentDir

while true; do
read -r opt1

if [ "$opt1" == "y" ]; then
    opt1='.'
    printLine
    findFile
    printLine
elif [ "$opt1" != "y" ]; then
    if [ -d $opt1 ]; then
        printLine
        findFile
        printLine
    else
        echo -e -n "Folder does not exist\nPress 'r' to retry or any key to exit. [ r / anykey ]: "
            read -r ch
            if [ "$ch" == "r" ]; then
                curentDir
                continue
            else
                break
        fi
    fi
fi
break
done
