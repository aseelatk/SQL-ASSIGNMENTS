/*Insert 10 rows into both tables, as given below. 
Create a table named Country with fields: Id Country_name Population Area 
Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 
 */
 
 create table Country(
 Id int primary key,
 Country_name varchar(30),
 Population int,
 Area int);
 
 create table Persons(
 Id int primary key,
 fname varchar(30),
 lname varchar(30),
 Population int,
 Rating decimal(2,1),
 Country_Id int,
 Country_name varchar(30),
 FOREIGN KEY (Country_Id) REFERENCES Country(Id));

desc country;
desc Persons;

insert into Country (Id, Country_name, Population, Area) values
(1, 'USA', 331000000, 9833517),
(2, 'Canada', 37700000, 9984670),
(3, 'UK', 67800000, 242495),
(4, 'India', 1380000000, 3287263),
(5, 'Australia', 25690000, 7692024),
(6, 'Brazil', 212600000, 8515767),
(7, 'China', 1440000000, 9596961),
(8, 'Germany', 83000000, 357022),
(9, 'France', 67000000, 551695),
(10, 'Japan', 126500000, 377975);

select * from Country;

insert into Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) values
(1, 'John', 'Doe', 331000000, 4.2, 1, 'USA'),
(2, 'Jane', 'Smith', 37700000, 4.8, 2, 'Canada'),
(3, 'Alice', 'Johnson', 67800000, 3.9, 3, 'UK'),
(4, 'Robert', 'Brown', 1380000000, 4.5, 4, 'India'),
(5, 'Maria', 'Garcia', 25690000, 4.7, 5, 'Australia'),
(6, 'Carlos', 'Martinez', 212600000, 3.5, 6, 'Brazil'),
(7, 'Chen', 'Li', 1440000000, 4.9, 7, 'China'),
(8, 'David', 'Wilson', 83000000, 3.6, 8, 'Germany'),
(9, 'Emma', 'Taylor', 67000000, 4.1, 9, 'France'),
(10, 'Yuki', 'Sato', 126500000, 3.8, 10, 'Japan');

select * from Persons;

-- (1)List the distinct country names from the Persons table 
select distinct Country_name from Persons;

-- (2)Select first names and last names from the Persons table with aliases. 
select fname as FirstName, lname as LastName from persons;

-- (3)Find all persons with a rating greater than 4.0. 
select * from persons where Rating>4.0;

-- (4)Find countries with a population greater than 10 lakhs. 
select * from Country where Population>1000000;

-- (5)Find persons who are from 'USA' or have a rating greater than 4.5. 
select * from Persons where Country_name = 'USA' or Rating>4.5;

-- (6)Find all persons where the country name is NULL. 
update Persons set Country_name= NULL where Id=5;
select * from Persons;
select * from Persons where Country_name IS NULL;

-- Find all persons from the countries 'USA', 'Canada', and 'UK'
select * from Persons where Country_name in ('USA','Canada','UK');

-- (8)Find all persons not from the countries 'India' and 'Australia'.
select * from Persons where Country_name not in ('India','Australia');

-- (9)Find all countries with a population between 5 lakhs and 20 lakhs. 
select * from Country where Population between 500000 and 2000000;
select * from Country;

--  (10)Find all countries whose names do not start with 'C'.
select * from Country where Country_name not like 'C%';