#FUNCTION: A function is a block of code that performs a specific task. 
def greet(name):
    return f"Hello, {name}!" 

print(greet("Alice"))

def add(a, b):
    return a + b

result = add(10, 20)
print(result)
#iterator: An iterator is an object that reads or access one item at a time from a collection such as a list, tuple, or string.
#Instead of taking all the values together, it gives one value each time you ask for it. 
numbers = [10, 20, 30]

it = iter(numbers)

print(next(it))
print(next(it))
print(next(it))
#iter() function to create an iterator and the next() function to get the next element.

#generator: A generator is a special type of function that generates one value at a time using the yield keyword.
def numbers():
    yield 1   #returns one value and pause the function     
    yield 2
    yield 3

gen = numbers()

print(next(gen))
print(next(gen))
print(next(gen))

#return: returns a value and ends the function and stops completely 
#yield :returns a value and pause the function and resumes when next() is called again.
#generate numbers from 1 to 10 
def numbers():
    for i in range(1, 6):
        yield i

gen = numbers()

for value in gen:
    print(value)
#where do we use?
#reading large files,streaming data or creating infinite sequences.
#generate function for the cubes of numbers
def cube_numbers(n):
    for i in range(1, n + 1):
        yield i ** 3

gen = cube_numbers(5)

for value in gen:
    print(value)
#Generate Fibonacci Sequence up to n
def fibonacci(n):
    a = 0
    b = 1

    while a <= n:
        yield a
        a, b = b, a + b

n = int(input("Enter the limit: "))

for num in fibonacci(n):
    print(num)

#map and reduce both are functions used to process data from a collection without using explicit loops.
#map():is used to apply the same operation to every item in a list .
#we use map for converting data types, calculating values,processing large data
#syntax:map(function, iterable)
#square of numbers using map
numbers = [1, 2, 3, 4, 5]

def square(x):
    return x * x

result = map(square, numbers)

print(list(result))

#reduce: takes many values and reduces them into a single value by repeatedly applying a function.
#Why do we use reduce? when we need to perform a repeated calculation on a list and get one final answer.
#finding largest number  
#combining data 
#finding max number usig reduce
from functools import reduce

numbers = [10, 45, 25, 90, 30]

maximum = reduce(lambda x, y: x if x > y else y, numbers)

print(maximum)
# Combine Words into a Sentence
words = ["Hello", "from", "the", "other", "side"]
sentence = reduce(lambda x, y: x + " " + y, words)
print(sentence)
#lambda: A lambda function is used for short and simple operations that do not require a full function definition.
from functools import reduce

numbers = [1, 2, 3, 4]

total = reduce(lambda x, y: x + y, numbers)

print(total)
# Filter Even Numbers
numbers = [1, 2, 3, 4, 5, 6]

even = filter(lambda x: x % 2 == 0, numbers)

print(list(even))

#filter: is used to filter items from an iterable based on a condition. 
#It takes a function and an iterable as arguments and returns a new iterable containing only the items for which the function returns True.
