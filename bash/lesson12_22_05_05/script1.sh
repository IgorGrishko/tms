#!/bin/bash
# TechMeSkill homework from lesson12_22_05_05
# Writen 2022.05.11
# Script to multiply the numbers and define even and odd numbers

printLine(){
    echo "---------------------------------------------------------------------------------"
}

multNum(){
    (( res = n1 * n2 )) #let "res = n1 * n2"
    echo "The result of $n1 * $n2 is $res"
    (( res2 = $res % 2 )) #let "res2 = $res % 2"
    if [ $res2 -eq 0 ]; then
        echo "$res is an even number"
    else
        echo "$res is an odd number"
    fi
}

printLine
echo "Welcome to multiply script"

while true; do
printLine
echo -n "Enter first number. [ number 1 ]: "; read -r n1
echo -n "Enter second number. [ number 2 ]: "; read -r n2
multNum
printLine
echo -e -n "Would you like to try more?\nPress 'y' to retry or anykey to exit. [ y / anykey ]: "; read -r ch
if [ "$ch" == "y" ]; then
    continue
else
    break
fi
done
printLine
