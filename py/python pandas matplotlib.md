Python: A Comprehensive Overview
This document provides a detailed and elaborated explanation of Python, a high-level, interpreted, general-purpose programming language. It covers core concepts, fundamental constructs, and advanced topics, presented in a structured format.
1. Introduction to Python
Python is a versatile, powerful, and easy-to-learn programming language created by Guido van Rossum and first released in 1991. It emphasizes readability and simplicity, making it an excellent choice for beginners while also being robust enough for complex, large-scale applications.
1.1 Key Features of Python
 * Interpreted Language: Python code is executed line by line by an interpreter, making the development cycle faster as there's no separate compilation step.
 * High-Level Language: Abstraction from low-level details like memory management, allowing developers to focus on problem-solving.
 * Dynamically Typed: Variable types are determined at runtime, not compile time. This offers flexibility but requires careful handling to avoid type-related errors.
 * Object-Oriented: Supports object-oriented programming (OOP) paradigms, allowing for modular and reusable code through classes and objects.
 * Cross-Platform: Python code can run on various operating systems (Windows, macOS, Linux, Unix) without modification.
 * Extensive Standard Library: A rich collection of modules and packages that provide functionalities for a wide range of tasks, from web development to data science.
 * Large and Active Community: A vast global community contributes to its development, creates libraries, and provides support.
 * Readability: Python's syntax is designed to be clear and concise, often resembling natural language. Indentation is mandatory and used to define code blocks.
 * Embeddable and Extensible: Python can be embedded into other applications as a scripting interface, and it can be extended with modules written in C or C++ for performance-critical tasks.
1.2 Common Use Cases
 * Web Development: (e.g., Django, Flask, FastAPI)
 * Data Science & Machine Learning: (e.g., NumPy, Pandas, Scikit-learn, TensorFlow, PyTorch)
 * Artificial Intelligence: (e.g., natural language processing, computer vision)
 * Automation & Scripting: (e.g., system administration, task automation)
 * Desktop GUI Applications: (e.g., Tkinter, PyQt, Kivy)
 * Game Development: (e.g., Pygame)
 * Scientific and Numeric Computing: (e.g., SciPy, Matplotlib)
 * Education: Widely used for teaching programming concepts.
2. Core Concepts
2.1 Variables and Data Types
Variables are used to store data values. Python has several built-in data types.
 * Numbers:
   * int (Integers): Whole numbers (e.g., 10, -5, 1000000). Python's integers have arbitrary precision.
   * float (Floating-point numbers): Numbers with a decimal point (e.g., 3.14, -0.5, 2.0e-3).
   * complex (Complex numbers): Numbers with a real and imaginary part (e.g., 3 + 2j).
 * Strings (str): Sequences of characters, enclosed in single (' '), double (" "), or triple quotes (''' ''' or """ """). Triple quotes are used for multi-line strings.
   * Example: 'hello', "Python is fun", """This is a multi-line string."""
 * Booleans (bool): Represent truth values, either True or False. Used in conditional statements.
 * NoneType (None): Represents the absence of a value or a null value. It's a unique object.
Example:
name = "Alice"    # String
age = 30          # Integer
height = 1.75     # Float
is_student = True # Boolean
job_title = None  # NoneType

2.2 Operators
Operators are symbols that perform operations on values and variables.
 * Arithmetic Operators: + (addition), - (subtraction), * (multiplication), / (division), % (modulo), ** (exponentiation), // (floor division).
 * Comparison Operators: == (equal to), != (not equal to), > (greater than), < (less than), >= (greater than or equal to), <= (less than or equal to). Return True or False.
 * Logical Operators: and, or, not. Used to combine conditional statements.
 * Assignment Operators: =, +=, -=, *=, /=, %=, **=, //=.
 * Identity Operators: is, is not. Used to check if two variables refer to the same object in memory.
 * Membership Operators: in, not in. Used to check if a value is present in a sequence (e.g., list, string, tuple).
Example:
x = 10
y = 3
print(x + y)    # 13
print(x > y)    # True
print(x % 2 == 0 and y % 2 != 0) # True

2.3 Comments
Comments are used to explain code and make it more readable. They are ignored by the Python interpreter.
 * Single-line comments: Start with #.
 * Multi-line comments (Docstrings): Enclosed in triple quotes (""" """ or ''' '''). Often used to document functions, classes, and modules.
Example:
# This is a single-line comment

"""
This is a multi-line comment
or a docstring for a function or module.
"""

3. Python Data Structures
Python provides several built-in data structures to organize and store collections of data.
3.1 Lists (list)
 * Ordered, mutable (changeable) collections of items.
 * Items are enclosed in square brackets [] and separated by commas.
 * Can contain items of different data types.
 * Support indexing (accessing elements by position) and slicing.
Example:
my_list = [1, "hello", 3.14, True]
print(my_list[0])   # Output: 1
my_list.append(5)   # Adds 5 to the end
my_list[1] = "world" # Modifies an element
print(my_list)      # Output: [1, 'world', 3.14, True, 5]

3.2 Tuples (tuple)
 * Ordered, immutable (unchangeable) collections of items.
 * Items are enclosed in parentheses () and separated by commas.
 * Often used for heterogeneous collections of elements that are accessed via unpacking or indexing (e.g., coordinates, return values from functions).
Example:
my_tuple = (1, "hello", 3.14)
print(my_tuple[1]) # Output: hello
# my_tuple[0] = 5  # This would raise a TypeError

3.3 Dictionaries (dict)
 * Unordered, mutable collections of key-value pairs.
 * Keys must be unique and immutable (e.g., strings, numbers, tuples). Values can be of any type.
 * Items are enclosed in curly braces {}.
 * Efficient for lookup operations based on keys.
Example:
my_dict = {"name": "Alice", "age": 30, "city": "New York"}
print(my_dict["name"])    # Output: Alice
my_dict["age"] = 31       # Modifies a value
my_dict["email"] = "alice@example.com" # Adds a new key-value pair
print(my_dict)

3.4 Sets (set)
 * Unordered, mutable collections of unique items.
 * Items are enclosed in curly braces {} (or using set() constructor for empty set).
 * Useful for removing duplicates from a list, performing mathematical set operations (union, intersection, difference).
Example:
my_set = {1, 2, 3, 2, 4}
print(my_set)        # Output: {1, 2, 3, 4} (duplicates removed)
my_set.add(5)
print(2 in my_set)   # Output: True

4. Control Flow
Control flow statements determine the order in which instructions are executed.
4.1 Conditional Statements (if, elif, else)
Used to execute different blocks of code based on conditions.
Example:
score = 85
if score >= 90:
    print("Grade: A")
elif score >= 80:
    print("Grade: B")
else:
    print("Grade: C")

4.2 Loops
Used to repeatedly execute a block of code.
 * for loop: Iterates over a sequence (e.g., list, tuple, string, range).
   Example:
   fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)

for i in range(5): # Iterates from 0 to 4
    print(i)

 * while loop: Executes a block of code as long as a condition is true.
   Example:
   count = 0
while count < 3:
    print("Count:", count)
    count += 1

 * break and continue statements:
   * break: Terminates the current loop entirely.
   * continue: Skips the rest of the current iteration and proceeds to the next iteration of the loop.
5. Functions
Functions are blocks of organized, reusable code that perform a single, related action. They promote modularity and code reuse.
5.1 Defining and Calling Functions
 * Defined using the def keyword.
 * Can take arguments (inputs) and return a value (output) using the return statement.
Example:
def greet(name):
    """This function greets the person passed in as an argument."""
    return f"Hello, {name}!"

message = greet("Bob")
print(message) # Output: Hello, Bob!

5.2 Function Arguments
 * Positional Arguments: Passed in the order they are defined.
 * Keyword Arguments: Passed by specifying the parameter name, allowing for flexibility in order.
 * Default Arguments: Parameters with default values, making them optional.
 * Arbitrary Arguments (*args and **kwargs):
   * *args: Allows a function to accept an arbitrary number of positional arguments as a tuple.
   * **kwargs: Allows a function to accept an arbitrary number of keyword arguments as a dictionary.
Example:
def describe_person(name, age, city="Unknown"): # Default argument
    print(f"{name} is {age} years old and lives in {city}.")

describe_person("Charlie", 25)              # Positional, uses default city
describe_person(age=28, name="Diana")       # Keyword arguments
describe_person("Eve", 35, city="London")   # Positional, overrides default

5.3 Lambda Functions (Anonymous Functions)
 * Small, anonymous functions defined using the lambda keyword.
 * Can take any number of arguments but can only have one expression.
 * Often used for short, one-time operations, especially with higher-order functions like map(), filter(), sorted().
Example:
add_two = lambda x: x + 2
print(add_two(5)) # Output: 7

numbers = [1, 2, 3, 4]
squared_numbers = list(map(lambda x: x*x, numbers))
print(squared_numbers) # Output: [1, 4, 9, 16]

6. Object-Oriented Programming (OOP)
Python is a multi-paradigm language that fully supports OOP. OOP allows modeling real-world entities as objects, promoting modularity, reusability, and easier management of complex systems.
6.1 Classes and Objects
 * Class: A blueprint or a template for creating objects. It defines attributes (data) and methods (functions) that the objects will possess.
 * Object (Instance): A specific instance of a class. When a class is defined, no memory is allocated; memory is allocated only when an object is created.
Example:
class Dog:
    # Class attribute
    species = "Canis familiaris"

    # Constructor method (__init__)
    def __init__(self, name, age):
        self.name = name  # Instance attribute
        self.age = age    # Instance attribute

    # Instance method
    def bark(self):
        return f"{self.name} says Woof!"

# Creating objects (instances)
my_dog = Dog("Buddy", 3)
your_dog = Dog("Lucy", 5)

print(my_dog.name)        # Output: Buddy
print(your_dog.bark())    # Output: Lucy says Woof!
print(Dog.species)        # Output: Canis familiaris

6.2 Inheritance
 * Allows a new class (subclass/derived class) to inherit attributes and methods from an existing class (superclass/base class).
 * Promotes code reuse and establishes an "is-a" relationship.
Example:
class Labrador(Dog): # Labrador inherits from Dog
    def __init__(self, name, age, color):
        super().__init__(name, age) # Call parent class constructor
        self.color = color

    def retrieve(self):
        return f"{self.name} is retrieving the ball!"

my_lab = Labrador("Max", 2, "golden")
print(my_lab.name)     # Inherited attribute
print(my_lab.bark())   # Inherited method
print(my_lab.retrieve()) # New method

6.3 Encapsulation
 * Bundling data (attributes) and methods (functions) that operate on the data within a single unit (class).
 * Restricts direct access to some of an object's components, preventing unintended modification.
 * In Python, encapsulation is achieved through conventions (e.g., _attribute for protected, __attribute for private, though not strictly enforced).
6.4 Polymorphism
 * The ability of objects of different classes to respond to the same method call in different ways.
 * Achieved through method overriding (subclass provides its own implementation of a method already defined in its superclass) and duck typing ("If it walks like a duck and quacks like a duck, then it must be a duck").
Example:
class Cat:
    def speak(self):
        return "Meow!"

class Duck:
    def speak(self):
        return "Quack!"

def animal_sound(animal):
    print(animal.speak())

animal_sound(my_dog) # Calls Dog's bark method
animal_sound(Cat())  # Calls Cat's speak method
animal_sound(Duck()) # Calls Duck's speak method

7. Modules and Packages
7.1 Modules
 * A Python module is a file containing Python definitions and statements (e.g., functions, classes, variables).
 * The filename is the module name with the .py extension.
 * Used to organize code logically and promote reusability.
7.2 Packages
 * A package is a way of organizing related modules into a directory hierarchy.
 * A directory must contain an __init__.py file (even if empty) to be recognized as a package.
 * Packages can contain subpackages.
7.3 Importing
 * import module_name: Imports the entire module. Access members using module_name.member.
 * import module_name as alias: Imports the module with an alias.
 * from module_name import member: Imports specific members from a module.
 * from module_name import *: Imports all members (generally discouraged due to potential name clashes).
Example:
import math
print(math.sqrt(16)) # Output: 4.0

from datetime import date
today = date.today()
print(today)

8. Error Handling (Exceptions)
Python uses exceptions to handle errors and exceptional events that occur during program execution.
 * try block: Contains code that might raise an exception.
 * except block: Catches specific exceptions and handles them gracefully.
 * else block: (Optional) Executes if no exception occurs in the try block.
 * finally block: (Optional) Always executes, regardless of whether an exception occurred or not. Useful for cleanup operations (e.g., closing files).
Example:
try:
    num1 = int(input("Enter a number: "))
    num2 = int(input("Enter another number: "))
    result = num1 / num2
    print(f"Result: {result}")
except ValueError:
    print("Invalid input. Please enter valid numbers.")
except ZeroDivisionError:
    print("Cannot divide by zero!")
except Exception as e: # Catch any other unexpected exception
    print(f"An unexpected error occurred: {e}")
finally:
    print("Execution complete.")

9. File I/O
Python provides built-in functions to interact with files.
 * Opening files: open(filename, mode)
   * 'r' (read - default)
   * 'w' (write - creates new file or overwrites existing)
   * 'a' (append - adds to end of file)
   * 'x' (exclusive creation - fails if file exists)
   * 't' (text mode - default)
   * 'b' (binary mode)
   * '+' (update - read and write)
 * Reading files: read(), readline(), readlines()
 * Writing to files: write(), writelines()
 * Closing files: close() (important to release resources)
9.1 The with statement (Context Manager)
Recommended for file operations as it ensures the file is automatically closed, even if errors occur.
Example:
# Writing to a file
with open("my_file.txt", "w") as file:
    file.write("Hello, Python!\n")
    file.write("This is a new line.")

# Reading from a file
with open("my_file.txt", "r") as file:
    content = file.read()
    print(content)

10. Advanced Topics (Brief Overview)
10.1 Decorators
 * Functions that modify or enhance the behavior of other functions or methods without permanently altering them.
 * They are essentially syntactic sugar for wrapping one function inside another.
Example:
def debug_decorator(func):
    def wrapper(*args, **kwargs):
        print(f"Calling {func.__name__} with args: {args}, kwargs: {kwargs}")
        result = func(*args, **kwargs)
        print(f"{func.__name__} returned: {result}")
        return result
    return wrapper

@debug_decorator
def add(a, b):
    return a + b

add(10, 5)

10.2 Generators
 * Functions that return an iterator that can be iterated over (one item at a time).
 * They yield values instead of returning them.
 * Generate values on the fly, saving memory, especially for large sequences.
Example:
def fibonacci_sequence(n):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

fib_gen = fibonacci_sequence(5)
print(list(fib_gen)) # Output: [0, 1, 1, 2, 3]

10.3 Iterators
 * Objects that can be iterated upon. They implement the __iter__() and __next__() methods.
 * Lists, tuples, strings, and dictionaries are all iterable objects.
10.4 Context Managers
 * Objects that define the methods __enter__() and __exit__(), used with the with statement to manage resources (like files or database connections) ensuring they are properly set up and torn down.
10.5 Comprehensions (List, Dictionary, Set)
 * Concise ways to create lists, dictionaries, or sets based on existing iterables.
Example:
# List comprehension
squares = [x*x for x in range(10) if x % 2 == 0]
print(squares) # Output: [0, 4, 16, 36, 64]

# Dictionary comprehension
cubes_dict = {x: x**3 for x in range(5)}
print(cubes_dict) # Output: {0: 0, 1: 1, 2: 8, 3: 27, 4: 64}

10.6 Multithreading and Multiprocessing
 * Multithreading: Allows multiple parts of a program (threads) to run concurrently within the same process. Python's Global Interpreter Lock (GIL) limits true parallelism for CPU-bound tasks, but it's useful for I/O-bound tasks.
 * Multiprocessing: Creates separate processes for parallelism, bypassing the GIL. More suitable for CPU-bound tasks.
10.7 Regular Expressions (re module)
 * A powerful tool for pattern matching and manipulation of strings.
10.8 Virtual Environments
 * Isolated Python environments that allow you to manage dependencies for different projects without conflicts. Tools like venv or conda are used.
This overview provides a solid foundation for understanding Python. Its simplicity, combined with its powerful features and vast ecosystem, makes it a highly valuable language for a wide range of applications.









Pandas: A Comprehensive Overview for Data Analysis
This document provides a detailed and elaborated explanation of Pandas, a fundamental library for data manipulation and analysis in Python. It covers its core data structures, essential functionalities, and common use cases, presented in a structured format.
1. Introduction to Pandas
Pandas is an open-source Python library built on top of NumPy, designed for data manipulation and analysis. It provides high-performance, easy-to-use data structures and data analysis tools. The name "Pandas" is derived from "Panel Data," an econometrics term for datasets that include observations over multiple time periods for the same individuals.
1.1 Key Features of Pandas
 * Fast and Efficient Data Structures: Primarily Series (1D labeled array) and DataFrame (2D labeled table).
 * Integrated Data Handling: Easily handles missing data (NaN), allowing for flexible and robust data cleaning.
 * Flexible Data Alignment: Automatically aligns data based on labels (indexes), making operations on heterogeneous data straightforward.
 * Relational Database-like Operations: Supports operations like slicing, subsetting, aggregation, merging, and joining, similar to SQL.
 * Time Series Functionality: Robust tools for working with time-stamped data.
 * Input/Output Tools: Capable of reading and writing data in various formats (CSV, Excel, SQL databases, HDF5, JSON, etc.).
 * High Performance: Optimized for performance, particularly when dealing with large datasets. Written largely in Cython and C.
 * Integration with Other Libraries: Seamlessly integrates with other scientific computing libraries like NumPy, SciPy, Matplotlib, and Scikit-learn.
1.2 Why Pandas?
Before Pandas, Python's data analysis capabilities were fragmented. Pandas brought a unified, powerful, and intuitive set of tools, making it the de facto standard for data wrangling, cleaning, transformation, and analysis in Python. It simplifies complex data operations, allowing data scientists and analysts to focus more on insights rather than data plumbing.
2. Core Data Structures
Pandas introduces two primary data structures: Series and DataFrame.
2.1 Series
A Series is a one-dimensional labeled array capable of holding any data type (integers, strings, floats, Python objects, etc.). It's like a column in a spreadsheet or a SQL table, or a NumPy array with an associated axis label (index).
 * Labels (Index): Each element in a Series has a unique label (index), which can be implicitly generated (0, 1, 2...) or explicitly defined.
 * Homogeneous Data: Typically holds data of a single type.
Example:
import pandas as pd

# Create a Series from a list
s = pd.Series([10, 20, 30, 40, 50])
print("Series from list:\n", s)

# Create a Series with custom index
s_indexed = pd.Series([100, 200, 300], index=['a', 'b', 'c'])
print("\nSeries with custom index:\n", s_indexed)

# Accessing elements
print("\nElement at index 'b':", s_indexed['b'])
print("First element (positional):", s[0])

2.2 DataFrame
A DataFrame is a two-dimensional labeled data structure with columns of potentially different types. It's similar to a spreadsheet, a SQL table, or a dictionary of Series objects. It is the most commonly used Pandas object.
 * Rows and Columns: DataFrames have both a row index and a column index.
 * Heterogeneous Columns: Different columns can have different data types.
 * Tabular Data Representation: Ideal for representing tabular data.
Example:
import pandas as pd

# Create a DataFrame from a dictionary
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David'],
    'Age': [25, 30, 35, 28],
    'City': ['New York', 'London', 'Paris', 'New York']
}
df = pd.DataFrame(data)
print("DataFrame from dictionary:\n", df)

# Accessing columns
print("\n'Name' column (Series):\n", df['Name'])
print("\n'Age' column (Series using dot notation):\n", df.Age)

# Accessing rows (by label)
print("\nRow at index 0:\n", df.loc[0])

# Basic info
print("\nDataFrame Info:")
df.info()
print("\nDataFrame Description:\n", df.describe())

3. Data Input and Output
Pandas provides extensive functionality to read and write data from/to various file formats.
3.1 Reading Data
 * CSV: pd.read_csv('file.csv')
 * Excel: pd.read_excel('file.xlsx')
 * JSON: pd.read_json('file.json')
 * SQL Databases: pd.read_sql('SELECT * FROM table', connection_object)
 * HTML (tables): pd.read_html('url')
 * Clipboard: pd.read_clipboard() (reads content from clipboard)
Example:
# Assuming 'data.csv' exists with comma-separated values
# Name,Age,City
# Alice,25,New York
# Bob,30,London

try:
    df_csv = pd.read_csv('data.csv')
    print("\nDataFrame from CSV:\n", df_csv)
except FileNotFoundError:
    print("\n'data.csv' not found. Please create it for this example.")

3.2 Writing Data
 * CSV: df.to_csv('output.csv', index=False) (index=False to prevent writing the DataFrame index as a column)
 * Excel: df.to_excel('output.xlsx', sheet_name='Sheet1', index=False)
 * JSON: df.to_json('output.json', orient='records')
 * SQL Databases: df.to_sql('table_name', connection_object, if_exists='append', index=False)
Example:
# Write the 'df' created earlier to a CSV file
df.to_csv('my_data_output.csv', index=False)
print("\nDataFrame written to 'my_data_output.csv'")

4. Data Selection and Indexing
Efficiently accessing subsets of data is crucial for analysis.
4.1 Column Selection
 * Single Column: df['ColumnName'] (returns a Series)
 * Multiple Columns: df[['Column1', 'Column2']] (returns a DataFrame)
Example:
print("\nSelected 'Age' column:\n", df['Age'])
print("\nSelected 'Name' and 'City' columns:\n", df[['Name', 'City']])

4.2 Row Selection (Indexing)
 * .loc[] (Label-based indexing): Selects rows by index labels and columns by column labels.
   * df.loc[row_label]
   * df.loc[[row_label1, row_label2]]
   * df.loc[start_row_label:end_row_label] (inclusive for labels)
   * df.loc[row_label, column_label]
   * df.loc[row_label_slice, column_label_slice]
   * df.loc[boolean_array] (for conditional selection)
 * .iloc[] (Integer-location based indexing): Selects rows and columns by their integer positions (0-based).
   * df.iloc[row_position]
   * df.iloc[[row_pos1, row_pos2]]
   * df.iloc[start_row_pos:end_row_pos] (exclusive for positions)
   * df.iloc[row_pos, column_pos]
   * df.iloc[row_pos_slice, col_pos_slice]
Example:
# Using .loc[]
print("\nRow with label 1 using .loc:\n", df.loc[1])
print("\nRows with labels 0 and 2 using .loc:\n", df.loc[[0, 2]])
print("\n'Name' for row with label 0 using .loc:", df.loc[0, 'Name'])

# Using .iloc[]
print("\nRow at position 1 using .iloc:\n", df.iloc[1])
print("\nRows at positions 0 and 2 using .iloc:\n", df.iloc[[0, 2]])
print("\n'Name' for row at position 0 using .iloc:", df.iloc[0, 0])

4.3 Conditional Selection (Boolean Indexing)
Selecting rows based on conditions applied to column values.
Example:
# Select rows where Age is greater than 28
older_than_28 = df[df['Age'] > 28]
print("\nPeople older than 28:\n", older_than_28)

# Select rows with multiple conditions
london_or_older = df[(df['City'] == 'London') | (df['Age'] > 30)]
print("\nPeople from London OR older than 30:\n", london_or_older)

5. Handling Missing Data
Missing data (represented as NaN - Not a Number, or NaT - Not a Time) is common in real-world datasets. Pandas provides robust methods to deal with it.
5.1 Detecting Missing Data
 * df.isnull() or df.isna(): Returns a DataFrame of booleans indicating missing values.
 * df.notnull() or df.notna(): Returns a DataFrame of booleans indicating non-missing values.
 * df.isnull().sum(): Counts missing values per column.
Example:
import numpy as np
df_missing = pd.DataFrame({
    'A': [1, 2, np.nan, 4],
    'B': [5, np.nan, 7, 8],
    'C': [9, 10, 11, 12]
})
print("\nDataFrame with missing values:\n", df_missing)
print("\nMissing values count per column:\n", df_missing.isnull().sum())

5.2 Dropping Missing Data
 * df.dropna(): Drops rows (by default) or columns containing any missing values.
   * axis=0 (default): Drop rows.
   * axis=1: Drop columns.
   * how='any' (default): Drop if any NaN is present.
   * how='all': Drop if all values are NaN.
   * thresh=N: Keep rows/columns that have at least N non-NaN values.
Example:
df_dropped = df_missing.dropna()
print("\nDataFrame after dropping rows with any NaN:\n", df_dropped)

df_dropped_cols = df_missing.dropna(axis=1)
print("\nDataFrame after dropping columns with any NaN:\n", df_dropped_cols)

5.3 Filling Missing Data (Imputation)
 * df.fillna(value): Fills missing values with a specified value.
 * df.fillna(method='ffill') or df.fillna(method='pad'): Fills forward (propagates last valid observation forward).
 * df.fillna(method='bfill') or df.fillna(method='backfill'): Fills backward (propagates next valid observation backward).
 * df.fillna(df.mean()): Fills missing values in each column with the mean of that column.
Example:
df_filled_zero = df_missing.fillna(0)
print("\nDataFrame after filling NaN with 0:\n", df_filled_zero)

df_filled_mean = df_missing.fillna(df_missing.mean(numeric_only=True))
print("\nDataFrame after filling NaN with column mean:\n", df_filled_mean)

6. Data Operations
6.1 Basic Operations
 * Arithmetic Operations: Element-wise addition, subtraction, multiplication, division.
 * Descriptive Statistics: mean(), median(), mode(), sum(), min(), max(), std(), var(), count(), describe().
Example:
print("\nAge column mean:", df['Age'].mean())
print("DataFrame describe:\n", df.describe())

6.2 Applying Functions
 * df.apply(function, axis=...): Applies a function along an axis of the DataFrame.
 * Series.apply(function): Applies a function to each element of a Series.
 * df.applymap(function): Applies a function element-wise to a DataFrame (deprecated in favor of df.map or df.apply for specific cases).
 * Series.map(function or dict): Maps values of a Series according to a function or a dictionary.
Example:
# Add a new column 'Age_in_Months'
df['Age_in_Months'] = df['Age'].apply(lambda x: x * 12)
print("\nDataFrame with Age_in_Months:\n", df)

# Apply a function to an entire row (axis=1) or column (axis=0)
def categorize_age(row):
    if row['Age'] < 30:
        return 'Young'
    else:
        return 'Adult'

df['Age_Category'] = df.apply(categorize_age, axis=1)
print("\nDataFrame with Age_Category:\n", df)

6.3 Unique Values and Value Counts
 * Series.unique(): Returns unique values in a Series.
 * Series.nunique(): Returns the number of unique values.
 * Series.value_counts(): Returns a Series containing counts of unique values.
Example:
print("\nUnique cities:", df['City'].unique())
print("Number of unique cities:", df['City'].nunique())
print("City value counts:\n", df['City'].value_counts())

7. Grouping Data (groupby)
The groupby() method is one of the most powerful features, allowing you to group data based on one or more columns and then apply aggregate functions. It follows a "split-apply-combine" strategy.
 * Split: Data is split into groups based on some criteria.
 * Apply: A function is applied to each group independently.
 * Combine: The results of these operations are combined into a new data structure.
Example:
# Group by 'City' and calculate the mean age for each city
city_avg_age = df.groupby('City')['Age'].mean()
print("\nAverage Age by City:\n", city_avg_age)

# Group by 'City' and 'Age_Category' and count names
grouped_counts = df.groupby(['City', 'Age_Category'])['Name'].count()
print("\nName counts by City and Age Category:\n", grouped_counts)

# Applying multiple aggregate functions
city_stats = df.groupby('City').agg({
    'Age': ['mean', 'min', 'max'],
    'Name': 'count'
})
print("\nCity statistics:\n", city_stats)

8. Merging, Joining, and Concatenating DataFrames
Combining DataFrames is a common task when working with multiple data sources.
8.1 Concatenation (pd.concat)
 * Stacks DataFrames vertically or horizontally.
 * pd.concat([df1, df2]): Concatenates along rows (axis=0, default).
 * pd.concat([df1, df2], axis=1): Concatenates along columns.
Example:
df1 = pd.DataFrame({'A': [1, 2], 'B': [3, 4]})
df2 = pd.DataFrame({'A': [5, 6], 'B': [7, 8]})
df_concat_rows = pd.concat([df1, df2])
print("\nConcatenated rows:\n", df_concat_rows)

df3 = pd.DataFrame({'C': [9, 10], 'D': [11, 12]})
df_concat_cols = pd.concat([df1, df3], axis=1)
print("\nConcatenated columns:\n", df_concat_cols)

8.2 Merging (pd.merge)
 * Combines DataFrames based on common columns (keys), similar to SQL JOIN operations.
 * pd.merge(left, right, on='key_column', how='inner')
   * how argument:
     * 'inner' (default): Returns only rows that have matching keys in both DataFrames.
     * 'outer': Returns all rows from both DataFrames, filling NaN where no match.
     * 'left': Returns all rows from the left DataFrame, and matched rows from the right.
     * 'right': Returns all rows from the right DataFrame, and matched rows from the left.
   * on: Column(s) to join on. Can be a single column name or a list of names.
   * left_on, right_on: If key columns have different names in each DataFrame.
Example:
df_orders = pd.DataFrame({
    'OrderID': [1, 2, 3, 4],
    'CustomerName': ['Alice', 'Bob', 'Charlie', 'Alice'],
    'ProductID': [101, 102, 101, 103]
})

df_products = pd.DataFrame({
    'ProductID': [101, 102, 103, 104],
    'ProductName': ['Laptop', 'Mouse', 'Keyboard', 'Monitor'],
    'Price': [1200, 25, 75, 300]
})

# Inner merge on 'ProductID'
merged_df = pd.merge(df_orders, df_products, on='ProductID', how='inner')
print("\nInner Merged DataFrame (Orders with Product Details):\n", merged_df)

8.3 Joining (df.join)
 * Combines DataFrames based on their indexes (labels).
 * df1.join(df2): Joins the calling DataFrame with another DataFrame on their indexes.
Example:
df_customers = pd.DataFrame({
    'CustomerID': [1, 2, 3, 4],
    'CustomerName': ['Alice', 'Bob', 'Charlie', 'David']
}, index=[0, 1, 2, 3]) # Ensure index alignment for simple join

df_city_data = pd.DataFrame({
    'City': ['New York', 'London', 'Paris', 'New York'],
    'Population': [8_000_000, 9_000_000, 2_000_000, 8_000_000]
}, index=[0, 1, 2, 3])

# Joining by index
joined_df = df_customers.join(df_city_data)
print("\nJoined DataFrame (Customers with City Data by Index):\n", joined_df)

9. Reshaping and Pivoting
Changing the layout of tables to suit different analysis needs.
9.1 pivot_table
 * Creates a spreadsheet-style pivot table as a DataFrame.
 * Aggregates data based on one or more index/column keys.
 * pd.pivot_table(df, values='value_column', index='rows_column', columns='cols_column', aggfunc='mean')
Example:
data_sales = {
    'Region': ['East', 'West', 'East', 'West', 'East'],
    'Product': ['A', 'B', 'A', 'A', 'B'],
    'Sales': [100, 150, 120, 90, 180]
}
df_sales = pd.DataFrame(data_sales)

pivot_sales = pd.pivot_table(df_sales, values='Sales', index='Region', columns='Product', aggfunc='sum')
print("\nPivot Table (Sum of Sales by Region and Product):\n", pivot_sales)

9.2 melt
 * Unpivots a DataFrame from a "wide" format to a "long" format.
 * Transforms columns into rows, useful for tidy data principles.
Example:
df_wide = pd.DataFrame({
    'ID': [1, 2],
    'Math': [90, 85],
    'Science': [78, 92]
})
print("\nWide DataFrame:\n", df_wide)

df_long = df_wide.melt(id_vars=['ID'], var_name='Subject', value_name='Score')
print("\nLong DataFrame (Melted):\n", df_long)

10. Time Series Functionality
Pandas has excellent support for time series data.
10.1 DateTimeIndex
 * A specialized index for time-stamped data.
 * Created using pd.to_datetime() or pd.date_range().
Example:
dates = pd.to_datetime(['2023-01-01', '2023-01-02', '2023-01-03'])
ts_data = pd.Series([10, 12, 15], index=dates)
print("\nTime Series Data:\n", ts_data)

10.2 Resampling
 * Changing the frequency of time series data (e.g., from daily to monthly).
 * resample() method, followed by an aggregation function (e.g., sum(), mean()).
Example:
# Create a daily time series
daily_sales = pd.Series(np.random.randint(50, 200, 31),
                       index=pd.date_range(start='2024-01-01', periods=31, freq='D'))

# Resample to weekly sums
weekly_sales = daily_sales.resample('W').sum()
print("\nDaily Sales:\n", daily_sales.head())
print("\nWeekly Sales (Resampled):\n", weekly_sales)

11. Performance Considerations
While Pandas is generally fast, being mindful of performance can significantly help with large datasets.
 * Vectorization: Leverage Pandas and NumPy's vectorized operations instead of explicit Python loops (for loops), as vectorized operations are implemented in C and are much faster.
 * Choose Appropriate Data Types: Use the smallest data type that can hold your data (e.g., int8, float32) to reduce memory usage and improve speed.
 * Avoid apply() with simple operations: For element-wise operations, prefer vectorized operations or map()/replace() over apply() when possible. apply() is powerful but can be slow for large datasets if the function isn't vectorized.
 * Categorical Data: Convert columns with a limited number of unique string values to the category data type for memory efficiency and faster operations.
 * Indexing: Use well-defined and appropriate indexes for faster lookups and joins.
 * Chunking: For extremely large files that don't fit into memory, read them in chunks using read_csv(..., chunksize=N).
Example of Categorical Data:
df_large_strings = pd.DataFrame({'Gender': ['Male', 'Female', 'Male', 'Female', 'Other'] * 10000})
print("\nMemory usage before categorical conversion:", df_large_strings.memory_usage(deep=True).sum(), "bytes")

df_large_strings['Gender'] = df_large_strings['Gender'].astype('category')
print("Memory usage after categorical conversion:", df_large_strings.memory_usage(deep=True).sum(), "bytes")

12. Integration with Other Libraries
Pandas forms the backbone of many data science workflows in Python.
 * NumPy: Pandas builds directly on NumPy arrays for numerical computations.
 * Matplotlib/Seaborn: DataFrames can be directly plotted using these visualization libraries.
 * SciPy: Statistical functions and scientific computing.
 * Scikit-learn: Pandas DataFrames are the preferred input format for machine learning models.
Pandas is an indispensable tool for anyone working with data in Python, providing a robust and flexible framework for nearly every step of the data analysis pipeline. Mastering it is key to effective data science.






Matplotlib and Seaborn: A Comprehensive Overview for Data Visualization
This document provides a detailed explanation of Matplotlib and Seaborn, two essential Python libraries for creating static, interactive, and animated visualizations in Python. It covers their core functionalities, common plot types, and best practices, presented in a structured format.
1. Matplotlib: The Foundation of Python Plotting
Matplotlib is a comprehensive library for creating static, animated, and interactive visualizations in Python. It provides an object-oriented API for embedding plots into applications using general-purpose GUI toolkits like Tkinter, wxPython, Qt, or GTK+. It is the foundational plotting library in Python, on which many other libraries (including Seaborn) are built.
1.1 Key Features of Matplotlib
 * Versatility: Capable of creating a vast range of plots, from simple line plots to complex 3D visualizations.
 * Granular Control: Offers extremely fine-grained control over every element of a plot (lines, markers, labels, colors, axes, etc.). This allows for highly customized and publication-quality figures.
 * Integration: Works seamlessly with NumPy for numerical operations and Pandas DataFrames for data handling.
 * Backend Flexibility: Supports various backend renderers for different output formats (e.g., PNG, JPEG, PDF, SVG) and interactive environments.
 * Object-Oriented API: The recommended way to create plots, providing a clear and organized structure. There's also a simpler pyplot interface for quick plotting.
1.2 Matplotlib's Core Components
Every Matplotlib plot consists of several hierarchical components:
 * Figure: The entire window or page on which everything is drawn. It can contain one or more Axes. Think of it as the canvas.
   * Created using plt.figure().
 * Axes (or Subplot): The actual plotting area where data is plotted. A Figure can have multiple Axes, each with its own x-axis, y-axis, title, and labels. Think of it as an individual graph.
   * Created using fig.add_subplot() or more commonly with plt.subplots().
 * Axis: These are the number line-like objects and control the limits of what is shown, ticks, and tick labels.
 * Artist: Everything visible on the Figure is an Artist (e.g., Text objects, Line2D objects, collections, etc.).
1.3 Common Plot Types in Matplotlib (pyplot interface)
While the object-oriented approach is preferred for complex plots, pyplot is excellent for quick visualizations.
 * Line Plot (plt.plot()): Displays data points connected by straight line segments. Ideal for visualizing trends over time or continuous data.
   import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 10, 100)
y = np.sin(x)
plt.plot(x, y)
plt.title('Simple Sine Wave')
plt.xlabel('X-axis')
plt.ylabel('Y-axis')
plt.grid(True)
plt.show()

 * Scatter Plot (plt.scatter()): Displays individual data points. Useful for showing the relationship between two variables and identifying clusters or outliers.
   x = np.random.rand(50) * 10
y = np.random.rand(50) * 10
sizes = np.random.rand(50) * 500 # For varying point sizes
colors = np.random.rand(50)      # For varying point colors

plt.scatter(x, y, s=sizes, c=colors, alpha=0.7, cmap='viridis')
plt.title('Random Scatter Plot')
plt.xlabel('Feature 1')
plt.ylabel('Feature 2')
plt.colorbar(label='Color Value')
plt.show()

 * Bar Plot (plt.bar() / plt.barh()): Represents categorical data with rectangular bars. Good for comparing quantities across different categories.
   categories = ['A', 'B', 'C', 'D']
values = [23, 45, 56, 12]
plt.bar(categories, values, color='skyblue')
plt.title('Bar Chart of Category Values')
plt.xlabel('Category')
plt.ylabel('Value')
plt.show()

 * Histogram (plt.hist()): Displays the distribution of a single numerical variable by dividing data into bins and showing the frequency of observations in each bin.
   data = np.random.randn(1000) # Standard normal distribution
plt.hist(data, bins=30, color='lightcoral', edgecolor='black', alpha=0.7)
plt.title('Histogram of Random Data')
plt.xlabel('Value')
plt.ylabel('Frequency')
plt.show()

 * Box Plot (plt.boxplot()): Displays the distribution of numerical data and skewness by showing quartiles (25th, 50th, 75th percentiles) and potential outliers.
   data1 = np.random.normal(loc=0, scale=1, size=100)
data2 = np.random.normal(loc=2, scale=1.5, size=100)
plt.boxplot([data1, data2], labels=['Group 1', 'Group 2'])
plt.title('Box Plot of Two Groups')
plt.ylabel('Value')
plt.show()

1.4 Customization and Layout in Matplotlib
Matplotlib offers extensive customization options.
 * Titles and Labels: plt.title(), plt.xlabel(), plt.ylabel().
 * Legends: plt.legend(). Make sure to add label to your plot calls.
 * Colors, Markers, Linestyles: Controlled via arguments like color, marker, linestyle, linewidth, markersize.
 * Subplots (plt.subplots()): Creates a figure and a set of subplots. Returns a Figure object and an Axes object (or an array of Axes objects). This is the recommended way for structured plots.
   fig, axes = plt.subplots(nrows=1, ncols=2, figsize=(10, 4))

# Plot 1 on the first Axes
axes[0].plot(x, y, color='red', linestyle='--')
axes[0].set_title('Dashed Line')
axes[0].set_xlabel('X')
axes[0].set_ylabel('Y')

# Plot 2 on the second Axes
axes[1].scatter(x, y, color='blue', alpha=0.5)
axes[1].set_title('Scatter Plot')
axes[1].set_xlabel('X')
axes[1].set_ylabel('Y')

plt.tight_layout() # Adjust layout to prevent overlap
plt.show()

 * Figure Size: plt.figure(figsize=(width, height)) or fig, ax = plt.subplots(figsize=(width, height)).
 * Saving Plots: plt.savefig('my_plot.png', dpi=300, bbox_inches='tight').
2. Seaborn: Statistical Data Visualization
Seaborn is a Python data visualization library based on Matplotlib. It provides a high-level interface for drawing attractive and informative statistical graphics. It simplifies the process of creating complex plots, especially those involving statistical relationships, and makes your plots look aesthetically pleasing by default.
2.1 Key Features of Seaborn
 * High-Level Interface: Simplifies complex plotting tasks with fewer lines of code compared to raw Matplotlib.
 * Statistical Plotting: Specialized in visualizing statistical relationships, distributions, and comparisons. It often handles data aggregation and statistical estimation internally.
 * Beautiful Defaults: Offers visually appealing default styles and color palettes, making plots look good out-of-the-box.
 * Pandas Integration: Works very well with Pandas DataFrames, directly accepting column names as arguments for plotting.
 * Matplotlib Foundation: While simplifying plotting, it's built on Matplotlib, meaning you can still use Matplotlib's functions to fine-tune Seaborn plots.
2.2 Common Plot Types in Seaborn
Seaborn categorizes its plotting functions largely by the type of relationship they show or the number of variables involved.
2.2.1 Relational Plots (for relationships between variables)
 * seaborn.scatterplot(): Similar to Matplotlib's scatter, but with enhanced features for showing relationships and distinguishing groups (e.g., using hue, size, style arguments).
   import seaborn as sns
import pandas as pd

# Load example dataset
tips = sns.load_dataset("tips")

plt.figure(figsize=(8, 6))
sns.scatterplot(data=tips, x="total_bill", y="tip", hue="time", size="size", style="smoker", sizes=(20, 400), alpha=0.7)
plt.title('Total Bill vs Tip by Time of Day and Smoker Status')
plt.xlabel('Total Bill ($)')
plt.ylabel('Tip ($)')
plt.legend(title='Time/Smoker', bbox_to_anchor=(1.05, 1), loc='upper left')
plt.grid(True, linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()

 * seaborn.lineplot(): For visualizing time series or other ordered data, especially with confidence intervals for multiple observations.
   fmri = sns.load_dataset("fmri")

plt.figure(figsize=(10, 6))
sns.lineplot(data=fmri, x="timepoint", y="signal", hue="region", style="event")
plt.title('FMRI Signal Change Over Time by Region and Event')
plt.xlabel('Timepoint')
plt.ylabel('Signal')
plt.legend(title='Region/Event', bbox_to_anchor=(1.05, 1), loc='upper left')
plt.grid(True, linestyle='--', alpha=0.6)
plt.tight_layout()
plt.show()

2.2.2 Distribution Plots (for visualizing data distributions)
 * seaborn.histplot(): Enhanced histogram with options for KDE, multiple groups, and cumulative distributions.
   plt.figure(figsize=(8, 5))
sns.histplot(data=tips, x="total_bill", kde=True, hue="time", palette="viridis")
plt.title('Distribution of Total Bill by Time of Day')
plt.xlabel('Total Bill ($)')
plt.ylabel('Count')
plt.show()

 * seaborn.kdeplot() (Kernel Density Estimate): Plots a smooth, continuous estimate of the probability density function.
   plt.figure(figsize=(8, 5))
sns.kdeplot(data=tips, x="total_bill", hue="time", fill=True, common_norm=False, palette="magma", linewidth=2)
plt.title('KDE of Total Bill by Time of Day')
plt.xlabel('Total Bill ($)')
plt.ylabel('Density')
plt.show()

 * seaborn.displot(): A figure-level function that can draw histograms, KDEs, or ECDF plots with flexible subplot layouts.
   sns.displot(data=tips, x="total_bill", col="time", kde=True, kind="hist", height=4, aspect=1.2)
plt.suptitle('Distribution of Total Bill by Time of Day (Displot)', y=1.02)
plt.show()

2.2.3 Categorical Plots (for relationship between numerical and categorical variables)
 * seaborn.boxplot(): Enhanced box plot, great for showing distribution across categories.
   plt.figure(figsize=(8, 5))
sns.boxplot(data=tips, x="day", y="total_bill", hue="smoker", palette="pastel")
plt.title('Total Bill Distribution by Day and Smoker Status')
plt.xlabel('Day of Week')
plt.ylabel('Total Bill ($)')
plt.show()

 * seaborn.violinplot(): Similar to box plot but also shows the estimated probability density at each value (combines box plot and KDE).
   plt.figure(figsize=(8, 5))
sns.violinplot(data=tips, x="day", y="total_bill", hue="time", inner="quartile", palette="muted")
plt.title('Total Bill Distribution (Violin Plot) by Day and Time')
plt.xlabel('Day of Week')
plt.ylabel('Total Bill ($)')
plt.show()

 * seaborn.barplot(): Aggregates data by category and shows the mean (or other estimator) and confidence interval.
   plt.figure(figsize=(8, 5))
sns.barplot(data=tips, x="day", y="total_bill", hue="sex", estimator=np.mean, errorbar="sd", palette="rocket")
plt.title('Average Total Bill by Day and Sex with Standard Deviation')
plt.xlabel('Day of Week')
plt.ylabel('Average Total Bill ($)')
plt.show()

2.2.4 Regression Plots
 * seaborn.regplot(): Plots a scatter plot with a linear regression model fit.
   plt.figure(figsize=(7, 5))
sns.regplot(data=tips, x="total_bill", y="tip", line_kws={"color": "red"})
plt.title('Total Bill vs Tip with Regression Line')
plt.xlabel('Total Bill ($)')
plt.ylabel('Tip ($)')
plt.show()

 * seaborn.lmplot(): A figure-level function that combines regplot with Faceting (creating multiple plots based on categories).
   sns.lmplot(data=tips, x="total_bill", y="tip", col="time", row="smoker", height=4, aspect=1.2, line_kws={"color": "purple"})
plt.suptitle('Regression of Total Bill vs Tip by Time and Smoker (lmplot)', y=1.02)
plt.show()

2.2.5 Matrix Plots
 * seaborn.heatmap(): Visualizes matrix-like data (e.g., correlation matrices, confusion matrices) as a color-coded grid.
   # Calculate correlation matrix
iris = sns.load_dataset("iris")
# Select only numeric columns for correlation calculation
iris_numeric = iris.select_dtypes(include=[np.number])
corr_matrix = iris_numeric.corr()

plt.figure(figsize=(7, 6))
sns.heatmap(corr_matrix, annot=True, cmap='coolwarm', fmt=".2f", linewidths=.5)
plt.title('Correlation Matrix of Iris Dataset')
plt.show()

2.3 Customization in Seaborn
While Seaborn provides attractive defaults, you can still customize plots extensively.
 * Themes and Styles: sns.set_theme() or sns.set_style() (e.g., 'darkgrid', 'whitegrid', 'dark', 'white', 'ticks').
 * Color Palettes: sns.set_palette(), sns.color_palette(), or palette argument in functions.
 * Figure-level vs. Axes-level Functions:
   * Axes-level functions (e.g., scatterplot, histplot, boxplot): Return an Axes object and can be plotted on existing Matplotlib Axes. They are part of the object-oriented API.
   * Figure-level functions (e.g., relplot, displot, catplot, lmplot): Manage their own Matplotlib Figure and Axes, allowing for easy creation of complex multi-plot figures (faceting). They return a FacetGrid object.
 * Matplotlib Customization: Since Seaborn is built on Matplotlib, you can use Matplotlib's plt.title(), plt.xlabel(), plt.ylabel(), plt.xticks(), plt.yticks(), plt.xlim(), plt.ylim(), etc., after calling a Seaborn function.
   # Example combining Seaborn and Matplotlib customization
plt.figure(figsize=(9, 6))
sns.violinplot(data=tips, x="day", y="tip", hue="sex", palette="deep")

plt.title('Tip Distribution by Day and Sex', fontsize=16, color='darkblue')
plt.xlabel('Day of the Week', fontsize=12, color='gray')
plt.ylabel('Tip Amount ($)', fontsize=12, color='gray')
plt.ylim(0, 12) # Set y-axis limits
plt.yticks(np.arange(0, 13, 2)) # Set custom y-ticks
plt.grid(axis='y', linestyle='--', alpha=0.7) # Add horizontal grid lines
plt.legend(title='Gender', loc='upper left', bbox_to_anchor=(1.02, 1))
plt.tight_layout()
plt.show()

3. Matplotlib vs. Seaborn: When to Use Which?
 * Matplotlib:
   * Pros: Highly flexible and customizable, foundational, suitable for intricate plots, fine-grained control, 3D plotting.
   * Cons: Can be verbose for common statistical plots, default aesthetics are often less appealing.
   * Use when: You need complete control over every element, creating highly specialized plots, integrating into larger applications, or when Seaborn doesn't offer a specific plot type you need.
 * Seaborn:
   * Pros: High-level, concise syntax, beautiful default aesthetics, built-in statistical estimations (confidence intervals, regressions), excellent for exploring relationships between multiple variables, good for categorical data and distributions.
   * Cons: Less granular control compared to Matplotlib for very specific customizations, might be overkill for simple plots.
   * Use when: You are doing exploratory data analysis, want quick yet attractive statistical plots, working with Pandas DataFrames, or visualizing distributions and relationships between multiple variables.
Conclusion: Matplotlib provides the canvas and the fundamental tools, while Seaborn acts as a specialized brush set that makes creating common statistical visualizations easier and more visually appealing. In practice, they are often used together: Seaborn for the main plot, and Matplotlib for fine-tuning titles, labels, limits, or combining multiple plots into a complex layout.
