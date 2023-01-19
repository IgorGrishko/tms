#!/usr/bin/python
# TMS Python lesson28_2022_07_21 task 3
# Writen 2022.07.23
# A script with a function that will receive arguments and print the list.
# Each arguments prints in a new string.

# function definition
def printList(range):
    for data in range:
        print(data)

# function calling
message = ''
while message != 'x':
    myList = input('Enter comma separated arguments, : ').split(',')
    # repeate request
    message = input('Press \"AnyKey\" to continue or \"x" to exit the script: ')
