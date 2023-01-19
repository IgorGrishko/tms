#!/usr/bin/python
# TMS Python lesson28_2022_07_21 task 2
# Writen 2022.07.23
# A script with a function that print all the files in directory recursively.
# And do the same for all folders in the directory.

# import modules
import os

# function definition
def obxodFile(path, level=1):
    print('Level=', level, 'Content:', os.listdir(path))
    for i in os.listdir(path):
        if os.path.isdir(path + '/' + i):
            print('Go down', path + '/' + i)
            obxodFile(path + '/' + i, level + 1)
            print('Return to', path)

# function calling
path = input('Input folder path: ')
obxodFile(path)
