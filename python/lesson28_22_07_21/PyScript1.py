#!/usr/bin/python
# TMS Python lesson28_2022_07_21 task 1
# Writen 2022.07.23
# A script with a function that multiply two numbers.
# Returns 0 if the result is an even number and 1 if not. 

# function definition
def mult(a,b):
    c = a*b
    return c

# argument requesting
a = float(input("Enter the first argument: "))
b = float(input("Enter the second argumentт: "))

# function calling
if mult(a,b) % 2 == 0:
    print(f"0 (The result of multiplying numbers {a} and {b} is an even number)")
else:
    print(f"1 (The result of multiplying numbers {a} and {b} is an odd number)")
