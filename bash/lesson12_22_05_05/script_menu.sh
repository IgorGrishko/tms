#!/bin/bash
# TechMeSkill homework from lesson12_22_05_05
# Writen 2022.05.11
# Script menue

printLine(){
    echo "---------------------------------------------------------------------------------"
}
printLine
echo "Select script to run"
printLine
echo "1. Multiplication"
echo "2. Print dir"
echo "3. Print array"
echo "To exit press anykey"
printLine
echo -n "[ 1 / 2 / 3 / anykey ]: "
read -r key

case $key in
    "1")
        ./hw1.sh
    ;;
    "2")
        ./hw2.sh
    ;;
    "3")
        ./hw3.sh
    ;;
    *)
        echo "Exit script"
        exit
    ;;
esac
