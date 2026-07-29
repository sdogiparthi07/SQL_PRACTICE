#oops: is a programming paradigm that organizes software using objects and classes.
# It helps make programs more modular, reusable, secure, and easier to maintain.
#Main Concepts of OOPS:
#class:A class is a blueprint or template for creating objects.
#object: An object is an instance of a class. It has properties (data) and behaviors (methods).
#how to define a class, how to create a class
#syntax
class ClassName:
    # attributes
    # methods

 class Student:
    name = "John"
    age = 20

    def display(self):
        print(self.name)
        print(self.age)
 s1 = Student()
 s1.display()

#init : runs automatically when you create an object. (Initializes object data when created)
class Student:
    def __init__(self, name, age):  #It runs automatically when an object is created.
        self.name = name
        self.age = age

    def display(self):
        print("Name:", self.name)
        print("Age:", self.age)

s1 = Student("John", 20)  # Creating objects
s2 = Student("Alice", 22)

s1.display()   # Calling method
s2.display()
#__str__ :  is a special method in Python that defines how an object should be represented as a string when you use print() on that object.
# purpose : Controls how object appears when printed
#without __str__
class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age


s1 = Student("John", 20)

print(s1)
#with __str__
class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return f"Name: {self.name}, Age: {self.age}"


s1 = Student("John", 20)

print(s1)

class Car:
    def __init__(self, brand, color):
        self.brand = brand
        self.color = color

    def __str__(self):
        return f"{self.color} {self.brand}"


car1 = Car("BMW", "Black")

print(car1)
#__repr__: defines the official string representation of an object. 
# It is mainly used for developers/debugging and should provide detailed information about the object.
#without __repr__ : 
class Student:
  def __init__(self, name, age):
        self.name = name
        self.age = age


s1 = Student("John", 20)

print(repr(s1))
#using __repr__
class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __repr__(self):
        return f"Student('{self.name}', {self.age})"


s1 = Student("John", 20)

print(repr(s1))

class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age

    def __str__(self):
        return f"{self.name} is {self.age} years old"

    def __repr__(self):
        return f"Student('{self.name}', {self.age})"


s1 = Student("John", 20)

print(s1)          # calls __str__
print(repr(s1))    # calls __repr__

class Student:
    def __init__(self, name, age, course):
        self.name = name
        self.age = age
        self.course = course

    def __str__(self):
        return f"Student Name: {self.name}, Age: {self.age}"

    def __repr__(self):
        return f"Student('{self.name}', {self.age}, '{self.course}')"

s1 = Student("John", 20, "Python") # Creating object
print(s1)  # __str__ is called by print()
print(repr(s1)) # __repr__ is called by repr()
#1.Encapsulation :means wrapping data and methods into a single unit (class) and restricting direct access to data using access modifiers.
#2.Inheritance:allows one class (child class) to use the properties and methods of another class (parent class).
#3.Polymorphism means "many forms." 
# The same method can behave differently in different situations.
#4.Abstraction :means hiding implementation details and showing only the essential features.

#Inheritance:
class Animal:
    def eat(self):
        print("Animal is eating")


class Dog(Animal):
    def bark(self):
        print("Dog is barking")


# Creating object of child class
dog1 = Dog()

dog1.eat()   # Parent method
dog1.bark()  # Child method

class Person:
    def __init__(self, name):
        self.name = name

    def display(self):
        print("Name:", self.name)


class Student(Person):
    def __init__(self, name, roll_no):
        super().__init__(name)
        self.roll_no = roll_no

    def show(self):
        print("Roll No:", self.roll_no)


s1 = Student("John", 101)

s1.display()
s1.show()

#Abstarction : hiding the internal implementation details and showing only the essential features to the user.
#It focuses on what an object does instead of how it does it.
#Python provides abstraction using the abc module: ABC → Used to create an abstract class
from abc import ABC, abstractmethod   
# EXAMPLE:  Imagine every vehicle must have a start() function, but the way each vehicle starts is different.
from abc import ABC, abstractmethod

# Abstract class
class Vehicle(ABC):

    @abstractmethod
    def start(self):
        pass


# Child class
class Car(Vehicle):

    def start(self):
        print("Car starts using a key")


class Bike(Vehicle):

    def start(self):
        print("Bike starts using a button")


# Creating objects
car = Car()
bike = Bike()

car.start()
bike.start()
#EXAMPLE2: The user only knows Make payment.The user does not need to know how the payment happens internally.
from abc import ABC, abstractmethod
class Payment(ABC):

    @abstractmethod
    def pay(self, amount):
        pass


class CreditCard(Payment):

    def pay(self, amount):
        print(f"Paid ${amount} using Credit Card")


class UPI(Payment):

    def pay(self, amount):
        print(f"Paid ${amount} using UPI")


class Cash(Payment):

    def pay(self, amount):
        print(f"Paid ${amount} using Cash")


# Objects
p1 = CreditCard()
p2 = UPI()
p3 = Cash()

p1.pay(100)
p2.pay(200)
p3.pay(300)


#__dict__: stores the attributes of an object in dictionary form.
class Student:
    def __init__(self, name, age):
        self.name = name
        self.age = age


s1 = Student("John", 20)

print(s1.__dict__)
#kwargs and arcs
def student(**details):
    print(details)


student(name="John", age=20, course="Python")
def add(*numbers):
    print(numbers)


add(10, 20, 30, 40)
class Student:

    def __init__(self, *args, **kwargs):
        print(args) # allows a function to accept any number of positional arguments.
        print(kwargs) #allows a function to accept any number of keyword arguments.


s1 = Student("John", 20, course="Python")
#positional arguments :Arguments passed according to their position are called positional arguments.
def student(name, age):
    print(name)
    print(age)


student("John", 20)
#overriding methods: Method overriding happens when a child class provides its own version of a parent class method.
#Only method overriding is specifically an inheritance concept. 
# The others are general Python/class concepts.
class Animal:

    def sound(self):
        print("Animal makes sound")


class Dog(Animal):

    def sound(self):
        print("Dog barks")


a = Animal()
d = Dog()

a.sound()
d.sound()

#encapsulating in the object in abstarction 
#encapsulation: bundling data (attributes) and behavior (methods) together inside a class and controlling access to the internal details.
class BankAccount:
    def __init__(self, balance):
        self.__balance = balance   # private variable

    def deposit(self, amount):
        self.__balance += amount

    def get_balance(self):
        return self.__balance


account = BankAccount(1000)
account.deposit(500)

print(account.get_balance())
#composition : Composition means creating objects using other objects.
class Engine:

    def start(self):
        print("Engine started")


class Car:

    def __init__(self):
        self.engine = Engine()

    def drive(self):
        self.engine.start()
        print("Car moving")


car = Car()
car.drive()
#Dynamic extension: Dynamic extension means adding or changing behavior at runtime.
class Person:

    def speak(self):
        print("Hello")


person = Person()
person.speak = lambda: print("New behavior")
person.speak()
#polymorphism : Different objects respond differently to the same method.
class Dog:

    def sound(self):
        print("Bark")


class Cat:

    def sound(self):
        print("Meow")


animals = [Dog(), Cat()]

for animal in animals:
    animal.sound()
#ducktyping : is a programming concept where Python cares about what an object can do, not what type of object it is.
class Dog:

    def speak(self):
        print("Bark")


class Cat:

    def speak(self):
        print("Meow")


def make_sound(animal):
    animal.speak()

dog = Dog()
cat = Cat()

make_sound(dog)
make_sound(cat)

class CreditCard:

    def pay(self, amount):
        print(f"Paid ${amount} using credit card")


class PayPal:

    def pay(self, amount):
        print(f"Paid ${amount} using PayPal")


class Bitcoin:

    def pay(self, amount):
        print(f"Paid ${amount} using Bitcoin")


def checkout(payment_method):

    payment_method.pay(100)


checkout(CreditCard())
checkout(PayPal())
checkout(Bitcoin())
#class variables : Shared by all objects
class Student:
    school = "ABC School"

    def __init__(self, name):
        self.name = name

s1 = Student("John")
s2 = Student("Alex")

print(s1.school)
print(s2.school)
# instance variable : Belongs to each object
class Student:

    def __init__(self, name):
        self.name = name

s1 = Student("John")   # Each object has its own value.
s2 = Student("Alex")

print(s1.name)
print(s2.name)

#local variable : A variable declared inside a function and available only within that function.
def calculate():
    x = 10   # local variable
    print(x)

calculate()

x = 50   # global variable


def test():

    x = 10   # local variable
    print("Inside:", x)
test()
print("Outside:", x)
#global variable : A variable declared outside functions and available throughout the program.
x = 100   # global variable
def display():

    print(x)

display()
print(x)

company_name = "ABC Corp"
def employee():

    employee_name = "John"

    print(employee_name)
    print(company_name)

employee()
#common methods in python class 1. instance 2. class method 3. static method
#1.Instance method:An instance method works with individual objects 
#It can access both instance variables and class variables
#It always takes self as its first parameter.U
#Use when the method needs to access or modify object-specific data.class Student
class Student:

    school = "ABC School"      # Class variable

    def __init__(self, name):
        self.name = name       # Instance variable

    def display(self):
        print("Name:", self.name)
        print("School:", Student.school)


s1 = Student("John")
s2 = Student("Alice")

s1.display()
s2.display()
#2.Class Method :A class method works with class-level data, not individual objects
#It always takes cls as its first parameter and uses the @classmethod decorator
#Use when the method needs to access or modify class level data shared by all objects.
class Student:

    school = "ABC School"

    @classmethod
    def show_school(cls):
        print("School:", cls.school)
Student.show_school()
#updating a class variable
class Student:

    school = "ABC School"

    @classmethod
    def change_school(cls, new_name):
        cls.school = new_name

Student.change_school("XYZ School")
print(Student.school)
#3.Static Method : A static method belongs to the class but does not use instance variables (self) or class variables (cls).
#Use the @staticmethod decorator
#Use when the method is a utility function related to the class but does not need object or class data.
class Calculator:

    @staticmethod
    def add(a, b):
        return a + b
print(Calculator.add(10, 20))

class Employee:

    company = "Tech Corp"

    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    # Instance Method
    def display(self):
        print(self.name, self.salary)

    # Class Method
    @classmethod
    def change_company(cls, name):
        cls.company = name

    # Static Method
    @staticmethod
    def bonus(salary):
        return salary * 0.10


emp = Employee("John", 50000)

emp.display()

Employee.change_company("OpenAI")
print(Employee.company)
print(Employee.bonus(50000))

#decorators :A decorator is a special function that modifies or extends the behavior of another function or class without changing its original code.
#Python provides several built-in decorators, such as:
    #@staticmethod
    #@classmethod
    #@property
    #@dataclass
#One of the most useful decorators for classes is @dataclass.
# @dataclass : The @dataclass decorator (from the dataclasses module) automatically generates common methods for a class, reducing boilerplate code.
#It automatically creates:
        #__init__()
        #__repr__()
        #__eq__() 
#without @dataclass
class Student:

    def __init__(self, name, age):
        self.name = name
        self.age = age


s = Student("John", 20)
print(s.name)
print(s.age)

#with @dataclass

from dataclasses import dataclass
@dataclass
class Student:
    name: str
    age: int
s = Student("John", 20)
print(s)
# create postinit within a dataclass
#When you use @dataclass, Python automatically creates the __init__() method for you.
#Sometimes, you need to perform additional work after the object is initialized, such as:
#Validating input
#Calculating derived values
#Formatting data

#validation :
from dataclasses import dataclass

@dataclass
class Student:
    name: str
    age: int

    def __post_init__(self):
        if self.age < 0:
            raise ValueError("Age cannot be negative")

s1 = Student("John", 20)
print(s1)

# report : Responsible for creating and managing report data
# reportsaver : Responsible for saving the report somewhere (file, database, cloud, etc.)
class Report:

    def __init__(self, title, content):
        self.title = title
        self.content = content

    def generate(self):
        return f"""
        Report Title: {self.title}

        Content:
        {self.content}
        """

