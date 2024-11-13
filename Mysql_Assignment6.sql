/*
Consider the Country table and Persons table that you created earlier and perform the following: 
(1)Perform inner join, Left join, and Right join on the tables. 
(2)List all distinct country names from both the Country and Persons tables. 
(3)List all country names from both the Country and Persons tables, including duplicates.
 (4)Round the ratings of all persons to the nearest integer in the Persons table.
 */
 
 SELECT * FROM country1;
 SELECT * FROM persons1;
 
UPDATE persons1 SET Country_Id='8' WHERE Id = 3;
UPDATE persons1 SET Country_Id='2' WHERE Id = 10;
UPDATE persons1 SET Country_Id='1' WHERE Id = 7;


-- (1)Perform inner join, Left join, and Right join on the tables. 
Select P.Id AS PersonID,P.Fname,C.Id AS CountryId,C.Country_name
from persons1 as P INNER JOIN country1 as C on P.Country_Id=C.Id;

Select P.Id AS PersonID,P.Fname,C.Id AS CountryId,C.Country_name
from persons1 as P LEFT JOIN country1 as C on P.Country_Id=C.Id;

Select P.Id AS PersonID,P.Fname,C.Id AS CountryId,C.Country_name
from persons1 as P RIGHT JOIN country1 as C on P.Country_Id=C.Id;



-- (2)List all distinct country names from both the Country and Persons tables. 
SELECT DISTINCT Country_name FROM country1
UNION
SELECT DISTINCT Country_name FROM persons1
JOIN Country1 ON persons1.Country_Id = country1.Id;

-- (3)List all country names from both the Country and Persons tables, including duplicates.
SELECT DISTINCT Country_name FROM country1
UNION ALL
SELECT DISTINCT Country_name FROM persons1
JOIN Country1 ON persons1.Country_Id = country1.Id;

--  (4)Round the ratings of all persons to the nearest integer in the Persons table.
SELECT  Fname,Lname,round(Rating) AS RoundedRating FROM persons1;
