/*
DML Commands
Create a table named Managers with fields : 
Manager_Id 
First_name 
Last_Name 
DOB Age ->Use check constraint 
Last_update 
Gender
Department
Salary -> NOT NULL 
1. Insert 10 rows. 
2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1. 
3. Write a query to display the annual income of all managers. 
4. Write a query to display records of all managers except ‘Aaliya’. 
5. Write a query to display details of managers whose department is IT and earns more than 25000 per month. 
6. Write a query to display details of managers whose salary is between 10000 and 35000.
*/
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age > 18 AND Age < 65),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender CHAR(1),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);

desc Managers;

INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'John', 'Doe', '1980-05-12', 44, 'M', 'IT', 30000),
(2, 'Emma', 'Smith', '1985-07-24', 39, 'F', 'HR', 25000),
(3, 'Michael', 'Johnson', '1978-03-11', 46, 'M', 'Finance', 40000),
(4, 'Aaliya', 'Khan', '1990-12-05', 33, 'F', 'IT', 27000),
(5, 'Chris', 'Brown', '1982-06-20', 42, 'M', 'Sales', 20000),
(6, 'Sophia', 'Wilson', '1988-09-15', 36, 'F', 'IT', 35000),
(7, 'Liam', 'Jones', '1975-02-22', 49, 'M', 'Operations', 28000),
(8, 'Olivia', 'Garcia', '1989-04-30', 35, 'F', 'IT', 33000),
(9, 'Noah', 'Martinez', '1984-08-17', 40, 'M', 'Finance', 15000),
(10, 'Isabella', 'Rodriguez', '1992-11-23', 31, 'F', 'HR', 23000);

select * from Managers;

select First_name,Last_Name,DOB from Managers where Manager_Id=1;

select First_name,Last_Name,(Salary*12) as Annual_Income from Managers;

select * from Managers where Manager_Id != 4;

select * from Managers where Department='IT' and Salary > 25000;

select * from Managers where Salary between 10000 and 35000;