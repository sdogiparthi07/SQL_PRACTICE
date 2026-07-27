#pandas: used for data manipulation, cleaning,analysis and processing.
#It supports series and dataframe to work with strucured data 
import os

print(os.listdir())
import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("employees.csv")

print(df.head())
print()

df.info()
print()

print(df.describe())
print()

print("Average Salary:", df["Salary"].mean())

df.plot(x="Age", y="Salary")
plt.show()
# tail and head:  Used to view the first or last few rows of a DataFrame.
import pandas as pd

df = pd.read_csv("employees.csv")

df.head(5)  #returns first  5 rows
df.tail(3)  #returns last 3 rows

#seletc only few coumns then we use datframe and list of things
import pandas as pd

df = pd.read_csv("employees.csv")

print(df)
#select one column 
print(df["Name"])
print(df.columns)
#practice pandas and numpy : Pandas and NumPy are used together in data analysis.
#NumPy → works with numerical data, arrays, mathematical operations.
#Pandas → works with tables (rows and columns), CSV/Excel data, data cleaning, analysis.
#bsic transformations on pandas and numpy 
import numpy as np
arr = np.array([10, 20, 30, 40, 50])  #create an array
print(arr)

print(arr.ndim)     # number of dimensions
print(arr.shape)    # size
print(arr.dtype)    # data type
#mathematical operations
arr = np.array([10, 20, 30, 40])

print(arr + 5)
print(arr * 2)
print(arr / 10)
#change data type
arr = np.array([1,2,3,4])

new_arr = arr.astype(float)

print(new_arr)
#statistics
arr = np.array([10,20,30,40,50])

print(np.mean(arr))
print(np.sum(arr))
print(np.max(arr))
print(np.min(arr))
#replace values
arr = np.array([10,20,30,40])

arr[arr > 25] = 0

print(arr)
#pandas
import pandas as pd
data = {
    "Name": ["John","Amy","Tom","Sam"],
    "Age": [25,30,22,28],
    "Salary": [50000,65000,45000,60000]
}

df = pd.DataFrame(data)

print(df)
#filtering data
high_salary = df[df["Salary"] > 50000]

print(high_salary)
#add new column
df["Bonus"] = df["Salary"] * 0.10

print(df)
#missing values practice
data = {
    "Name":["John","Amy","Tom"],
    "Salary":[50000,None,45000]
}

df = pd.DataFrame(data)

print(df)
#find missing values
print(df.isnull())
#fill missing values
df["Salary"] = df["Salary"].fillna(0)

print(df)
#sorting data
df.sort_values("Salary")
#desc
df.sort_values("Salary", ascending=False)
#group by
data = {
    "Department":["IT","HR","IT","HR"],
    "Salary":[50000,60000,70000,65000]
}

df = pd.DataFrame(data)

print(df.groupby("Department")["Salary"].mean())

#practice multiple operations 
import pandas as pd

data = {
    "Name": ["John", "Amy", "Tom", "Sam", "Eva"],
    "Age": [25, 30, 22, 28, 35],
    "Department": ["IT", "HR", "Finance", "IT", "HR"],
    "Salary": [50000, 65000, 45000, 60000, 72000]
}

df = pd.DataFrame(data)

print(df)
#Show only Name and Salary where Salary is greater than $50,000
result = df[df["Salary"] > 50000][["Name", "Salary"]]

print(result)
#Add New Column + Calculate Values
df["Bonus"] = df["Salary"] * 0.10  #adding 10% bonus

print(df)
#Multiple Column Calculation
df["Total_Pay"] = df["Salary"] + df["Bonus"]   #create total compensation

print(df)
#highest salary employees
top_salary = df.sort_values(
    "Salary",
    ascending=False
)[["Name", "Salary"]]

print(top_salary)
#merging operations 
import pandas as pd

employees = pd.DataFrame({
    "Emp_ID": [1, 2, 3, 4],
    "Name": ["John", "Amy", "Tom", "Sam"],
    "Dept_ID": [101, 102, 101, 103]
})

print(employees)
departments = pd.DataFrame({
    "Dept_ID": [101, 102, 104],
    "Department": ["IT", "HR", "Finance"]
})

print(departments)

import pandas as pd

print("Program is running")

df1 = pd.DataFrame({
    "Name":["John","Amy"],
    "Age":[25,30]
})

df2 = pd.DataFrame({
    "Name":["Tom","Sam"],
    "Age":[22,28]
})

result = pd.concat([df1, df2], ignore_index=True)

print(result)

#data visualisation with pandas
import pandas as pd
import matplotlib.pyplot as plt
data = {
    "Name": ["John", "Amy", "Tom", "Sam", "Eva"],
    "Age": [25, 30, 22, 28, 35],
    "Salary": [50000, 65000, 45000, 60000, 72000]
}

df = pd.DataFrame(data)

print(df)

df.plot(
    x="Name",
    y="Salary",
    kind="bar"
)

plt.show()
#cufflinks - heatmap and plotly

#eda

