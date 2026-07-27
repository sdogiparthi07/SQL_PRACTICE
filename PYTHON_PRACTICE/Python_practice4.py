#FILE OPERATION IN PYTHON
#Writing to a text file
file = open("myfile.txt", "w")  # Open a file in write mode
#reading from a text file
file.write("Hello, this is a sample text file.\n")  # Write a line
#read line by line
file.write("This is the second line.\n")  # Write another line
file.close()  # Close the file
#read a line with characters
file = open("myfile.txt", "r")  # Open the file in read mode
#copy file content to another file
with open("myfile.txt", "r") as f:
    content = f.read()  # Read the entire content of the file
    print(content)  # Print the content to the console
#copy file content to another file using for loop
with open("myfile.txt", "r") as f:
    with open("copyfile.txt", "w") as copy_f:
        for line in f:
            copy_f.write(line)  # Write each line to the new file
#r+ to read and write simultaneously
with open("example.txt", "r+") as file:
    data = file.read()      # Read the file
    print(data)

    file.write("\nNew line")  # Write to the same file

#dataframe:A DataFrame is a 2-dimensional labeled data structure in Pandas, consisting of rows and columns. 
# Each column can store different data types, making it suitable for tabular data like Excel spreadsheets or SQL tables.
#writing to an excel file
import pandas as pd

df = pd.DataFrame({
    "Name": ["Alice", "Bob"],
    "Marks": [85, 90]
})

df.to_excel("students.xlsx", sheet_name="Marks", index=False)
#reading from an excel file
import pandas as pd

df = pd.read_excel("students.xlsx")

print(df)
#with csv file 
import pandas as pd

df = pd.read_csv("filename.csv")


#modules :A module is a single Python file (.py) that contains reusable code such as functions, classes, and variables.
#Instead of writing the same code repeatedly, you can store it in a module and import it whenever needed.
mymath.py
def add(a, b):
    return a + b

def sub(a, b):
    return a - b

#using .py
import mymath

print(mymath.add(5, 3))
print(mymath.multiply(5, 3))
#built in modules : math, random, os, sys, datetime
#Libraries : A library is a collection of related modules that provides functionality for a specific purpose.
#A library can contain many module. 
# NumPy → Numerical computations
#Pandas → Data analysis
#Matplotlib → Data visualization
#TensorFlow → Machine learning
#package :A package is a collection of related modules organized in a directory (folder). 
# It helps organize Python code into a hierarchical structure.
#create a custom module : A custom module is a Python file (.py) that you create yourself to store reusable code.
# calculator.py

def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

pi = 3.14159
# main.py

import calculator

print(calculator.add(10, 5))
print(calculator.subtract(10, 5))

#  built in module 
#Python provides many built-in modules, such as 
#import math :Used for mathematical operations.
import math

print(math.sqrt(16))
print(math.pow(2, 3))
print(math.factorial(5))
print(math.pi)
#import random :Used to generate random numbers and make random selections.
import random

print(random.randint(1, 10))
print(random.choice(["Apple", "Banana", "Mango"]))

#import date time : Used to work with dates and times.
import datetime

today = datetime.datetime.now()
print(today)
#import os : Used to interact with the operating system.
import os

print(os.getcwd())   # Current working directory
#import statistics : Provides access to Python interpreter and system-specific information.
import sys

print(sys.version)

#errors and exception handling:
#Exception handling is a way to handle errors gracefully using try, except, else, and finally so that the program doesn't crash unexpectedly.
# 1. try and except : The code that may raise an exception is placed inside the try block.
#If an error occurs, the except block is executed.
try:
    num = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero")
#2. Multiple except Blocks : You can handle different exceptions separately.

try:
    num = int(input("Enter a number: "))
    result = 10 / num

except ValueError:
    print("Please enter a valid number.")

except ZeroDivisionError:
    print("Division by zero is not allowed.")
#3.else Block :The else block executes only if no exception occurs in the try block.
try:
    num = int(input("Enter a number: "))
    print(100 / num)

except ZeroDivisionError:
    print("Cannot divide by zero.")

except ValueError:
    print("Invalid input.")

else:
    print("Program executed successfully.")
#4.finally Block :The finally block always executes, whether an exception occurs or not.
#It is commonly used to release resources, such as closing files or database connections.
try:
    num = 10 / 2
    print(num)

except ZeroDivisionError:
    print("Cannot divide by zero.")

finally:
    print("Execution completed.")

#complete 
try:
    num = int(input("Enter a number: "))
    result = 100 / num

except ValueError:
    print("Please enter a valid integer.")

except ZeroDivisionError:
    print("Cannot divide by zero.")

else:
    print("Result:", result)

finally:
    print("Thank you! Program ended.")

#databse connectivity and operations using python ex. #sqlite
#General Steps for Database Connectivity

#Import the database module.
#Connect to the database.
#Create a cursor (for SQL databases).
#Execute SQL queries.
#Fetch results (SELECT queries).
#Commit changes (INSERT, UPDATE, DELETE).
#Close the connection.




