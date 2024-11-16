/*Consider the Country table and Persons table that you created earlier and perform the following: 
1. Add a new column called DOB in Persons table with data type as Date. 
2. Write a user-defined function to calculate age using DOB. 
3. Write a select query to fetch the Age of all persons using the function that has been created. 
4. Find the length of each country name in the Country table. 
5. Extract the first three characters of each country's name in the Country table. 
6. Convert all country names to uppercase and lowercase in the Country table.*/
ALTER TABLE Persons1
ADD DOB DATE;
select * from Persons1;

UPDATE Persons1
SET DOB = '1985-03-15'
WHERE Id = 1;

UPDATE Persons1
SET DOB = '1978-07-22'
WHERE Id = 2;

UPDATE Persons1
SET DOB = '1995-11-10'
WHERE Id = 3;

UPDATE Persons1
SET DOB = '1990-02-28'
WHERE Id = 4;

UPDATE Persons1
SET DOB = '1982-12-04'
WHERE Id = 5;

UPDATE Persons1
SET DOB = '1975-09-13'
WHERE Id = 6;

UPDATE Persons1
SET DOB = '1993-05-19'
WHERE Id = 7;

UPDATE Persons1
SET DOB = '1988-08-30'
WHERE Id = 8;

UPDATE Persons1
SET DOB = '1979-04-12'
WHERE Id = 9;

UPDATE Persons1
SET DOB = '1980-10-25'
WHERE Id = 10;

UPDATE Persons1
SET DOB = '1996-06-06'
WHERE Id = 11;

UPDATE Persons1
SET DOB = '1984-01-18'
WHERE Id = 12;

select * from persons1;

DELIMITER $$
CREATE FUNCTION CalculateAge(DOB date)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Age INT;
    SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN Age;
END $$
DELIMITER ;

SELECT Id,Fname,Lname,DOB, CalculateAge(DOB) AS Age FROM Persons1;

SELECT Country_name, length(Country_name) AS LengthOfCountryName FROM Country1;

SELECT Country_name, substring(Country_name,1,3) as First_three_characters FROM Country1;

SELECT Country_name, UPPER(Country_name) AS CountryName_Uppercase,LOWER(Country_name) AS CountryName_Lowercase FROM Country;