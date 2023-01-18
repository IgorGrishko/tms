#!/bin/bash
# TechMeSkill homework from lesson12_22_05_05
# Writen 2022.05.11
# Script to print array

printLine(){
    echo "---------------------------------------------------------------------------------"
}

printArr(){
    for i in "${arr[@]}"; do
        echo "$i"
    done
}

printLine
echo "Welcome to print array script"
printLine

arr=($(seq 1 10))
printArr
printLine
