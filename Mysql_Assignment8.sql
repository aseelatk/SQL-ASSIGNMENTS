/*
Consider the Country table and Persons table that you created earlier and perform the following: 
1. Find the number of persons in each country. 
2. Find the number of persons in each country sorted from high to low. 
3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
4. Find the countries with the same rating as the USA. (Use Subqueries) 
5. Select all countries whose population is greater than the average population of all nations. 

*/
select * from country;
select * from persons;
set sql_safe_updates=0;
update persons	set Country_name = 'Canada',lname='Sahib' where fname='Ali';
update persons	set Country_name = 'India',lname='Jacob' where fname='Sara';
update persons	set Country_name = 'Austraila' where id=5;

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(13, 'John', 'Doe', 123500000, 4.5, 1, 'USA'),
(14, 'Jane', 'Smith', 8000000, 3.9, 2, 'Canada'),
(15, 'Mike', 'Brown', 1287500000, 4.7, 2, 'Canada'),
(16, 'Emma', 'Wilson', 500000, 4.2, 1, 'USA'),
(17, 'Liam', 'Taylor', 700000, 3.5, 2, 'Canada');
-- 1. Find the number of persons in each country. 
Select Country_name,count(*) As Number_of_persons from persons group by Country_name;

-- 2. Find the number of persons in each country sorted from high to low. 
Select Country_name,count(*) As Number_of_persons from persons group by Country_name order by Number_of_persons desc ;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
select Country_name,avg(Rating) from persons group by Country_name having avg(Rating) >3.0;
-- 4. Find the countries with the same rating as the USA. (Use Subqueries) 
select avg(Rating) from persons where Country_name='USA';
select Country_name from persons where Rating=(select avg(Rating) from persons where Country_name='USA');

-- 5. Select all countries whose population is greater than the average population of all nations. 
select  country_name,population from country where population>(select avg(population) from country);
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*Create a database named Product and create a table called Customer with the following fields in the 
Product database: Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country */
CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St', 'Los Angeles', 'California', '90001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak Ave', 'New York', 'New York', '10001', 'USA'),
(3, 'Emily', 'Johnson', 'emily.j@example.com', '555-987-1234', '789 Maple Dr', 'Chicago', 'Illinois', '60601', 'USA'),
(4, 'Michael', 'Brown', 'm.brown@example.com', '444-222-1111', '321 Pine Ln', 'Houston', 'Texas', '77001', 'USA'),
(5, 'Olivia', 'Davis', 'olivia.d@example.com', '333-555-7777', '654 Birch Blvd', 'Phoenix', 'Arizona', '85001', 'USA'),
(6, 'Liam', 'Miller', 'liam.m@example.com', '111-222-3333', '987 Cedar Ct', 'Toronto', 'Ontario', 'M5B 1T8', 'Canada'),
(7, 'Sophia', 'Taylor', 'sophia.t@example.com', '222-444-6666', '135 Spruce Rd', 'Vancouver', 'British Columbia', 'V6B 1L1', 'Canada'),
(8, 'Noah', 'Anderson', 'noah.a@example.com', '999-888-7777', '246 Willow Way', 'Montreal', 'Quebec', 'H2X 3X6', 'Canada'),
(9, 'Ava', 'Thomas', 'ava.t@example.com', '555-444-3333', '369 Palm St', 'London', 'England', 'E1 6AN', 'UK'),
(10, 'Mason', 'Wilson', 'mason.w@example.com', '777-666-5555', '741 Redwood Pl', 'Manchester', 'England', 'M1 2HN', 'UK'),
(11, 'Lucas', 'Martin', 'lucas.m@example.com', '654-321-9870', '963 Poplar St', 'Sydney', 'New South Wales', '2000', 'Australia'),
(12, 'Mia', 'Jackson', 'mia.j@example.com', '789-123-6540', '159 Dogwood Ave', 'Melbourne', 'Victoria', '3000', 'Australia'),
(13, 'Ethan', 'White', 'ethan.w@example.com', '888-999-0000', '753 Beech Blvd', 'Brisbane', 'Queensland', '4000', 'Australia'),
(14, 'Harper', 'Harris', 'harper.h@example.com', '999-555-1111', '951 Sycamore Ln', 'Mumbai', 'Maharashtra', '400001', 'India'),
(15, 'Arjun', 'Patel', 'arjun.patel@example.com', '876-543-2109', '403 Rose Rd', 'Delhi', 'Delhi', '110001', 'India');

select * from customer;

/*1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
Then perform the SELECT operation for the customer_info view. */
create view  customer_info as select concat(First_name,' ',Last_name) as Full_Name,Email from Customer;
select * from customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US. 
create view US_Customers as select First_Name,Country from Customer where Country='USA';
select * from US_Customers;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
create view Customer_Details as select concat(First_name,' ',Last_name) as Full_Name,Email,Phone_no,State from Customer;
select * from Customer_Details;

-- 4. Update phone numbers of customers who live in California for Customer_details view. 
update Customer_Details set Phone_no = '123-456-1111' where State='California';
-- 5. Count the number of customers in each state and show only states with more than 5 customers
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(16, 'Mark', 'Spencer', 'mark.spencer@example.com', '321-654-9870', '22 Palm Dr', 'San Francisco', 'California', '94101', 'USA'),
(17, 'Nancy', 'Adams', 'nancy.adams@example.com', '654-321-7890', '789 Orange St', 'Sacramento', 'California', '94203', 'USA'),
(18, 'Gary', 'Miller', 'gary.miller@example.com', '123-654-7890', '456 Blue Ln', 'San Diego', 'California', '92101', 'USA'),
(19, 'Linda', 'White', 'linda.white@example.com', '987-321-6540', '303 Vine Ave', 'Fresno', 'California', '93701', 'USA'),
(20, 'Robert', 'King', 'robert.king@example.com', '741-852-9630', '401 Redwood Blvd', 'Beverly Hills', 'California', '90210', 'USA');

select * from Customer;
select  state,count(*) as No_of_customers from customer group by state having count(*)>5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
drop view customer_details;
select state,count(*) as No_of_Customers from customer_details group by state;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from customer_details order by state asc;