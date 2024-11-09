/*Create a table named Country with fields: Id Country_name Population Area
 Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 
*/
CREATE TABLE Country1 (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

INSERT INTO Country1 (Id, Country_name, Population, Area)
VALUES
(1, 'India', 1393409038, 3287263),
(2, 'China', 1444216107, 9596961),
(3, 'USA', 331002651, 9833517),
(4, 'Indonesia', 273523615, 1904569),
(5, 'Pakistan', 220892340, 881912),
(6, 'Brazil', 212559417, 8515767),
(7, 'Nigeria', 206139589, 923768),
(8, 'Bangladesh', 161376708, 147570),
(9, 'Russia', 145934462, 17098242),
(10, 'Mexico', 128932753, 1964375);

select * from Country1;


CREATE TABLE Persons1 (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2,1),
    Country_Id INT,
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

INSERT INTO Persons1 (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES
(1, 'John', 'Doe', 500000, 4.5, 1),
(2, 'Jane', 'Smith', 600000, 4.0, 2),
(3, 'Ahmed', 'Khan', 200000, 3.9, 3),
(4, 'Maria', 'Garcia', 450000, 4.6, 4),
(5, 'Chen', 'Wei', 700000, 3.8, 5),
(6, 'Anna', 'Ivanova', 300000, 4.2, 6),
(7, 'Lucas', 'Silva', 750000, 4.3, 7),
(8, 'Fatima', 'Ali', 550000, 3.7, 8),
(9, 'Olga', 'Petrova', 800000, 4.4, 9),
(10, 'Carlos', 'Martinez', 100000, 4.1, 10);

SELECT * FROM Persons1;

-- 1. Write an SQL query to print the first three characters of Country_name from the Country table.
SELECT LEFT(Country_name, 3) AS FirstThreeChars FROM Country1;

-- 2. Write an SQL query to concatenate first name and last name from Persons table. 
SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons1;

-- 3. Write an SQL query to count the number of unique country names from Persons table
SELECT COUNT(DISTINCT Country_Id) AS UniqueCountries FROM Persons1;

--  4. Write a query to print the maximum population from the Country table.
SELECT MAX(Population) AS MaxPopulation FROM Country1;

-- 5. Write a query to print the minimum population from Persons table.
SELECT MIN(Population) AS MinPopulation FROM Persons1;

-- 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
INSERT INTO Persons1 (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES
(11, 'Ali', NULL, 150000, 4.2, 2),
(12, 'Sara', NULL, 200000, 3.5, 4);

SELECT * FROM Persons1;
SELECT COUNT(Lname) AS LnameCount FROM Persons1;

-- 7. Write a query to find the number of rows in the Persons table
SELECT COUNT(*) AS TotalRows FROM Persons1;

-- 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
SELECT Population FROM Country1 LIMIT 3;

-- 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
SELECT * FROM Country1 ORDER BY RAND() LIMIT 3;

-- 10. List all persons ordered by their rating in descending order. 
SELECT * FROM Persons1 ORDER BY Rating DESC;

-- 11. Find the total population for each country in the Persons table. 
SELECT Country_Id, SUM(Population) AS TotalPopulation FROM Persons1 GROUP BY Country_Id;

-- 12. Find countries in the Persons table with a total population greater than 50,000
SELECT Country_Id FROM Persons1 GROUP BY Country_Id HAVING SUM(Population) > 50000;
 
-- 13. List the total number of persons and average rating for each country, but only for
--  countries with more than 1 persons, ordered by the average rating in ascending order.
SELECT Country_Id, COUNT(*) AS TotalPersons, AVG(Rating) AS AvgRating
FROM Persons1
GROUP BY Country_Id
HAVING COUNT(*) > 1
ORDER BY AvgRating ASC;






