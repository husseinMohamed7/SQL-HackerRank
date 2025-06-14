-- The Aggregation Problems

/*
The CITY table is described as follows:
CITY
Field          Type
ID             NUMBER
NAME           VARCHAR2(17)
COUNTRYCODE    VARCHAR2(3)
DISTRICT       VARCHAR2(20)
POPULATION     NUMBER
*/

--001- Revising Aggregations - The Count Function
/*
Query a count of the number of cities in CITY having a Population larger than 100000.
*/

SELECT COUNT(ID)
FROM CITY
WHERE POPULATION > 100000;

--002- Revising Aggregations - The Sum Function
/*
Query the total population of all cities in CITY where District is California.
*/

SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

--003- Revising Aggregations - The Sum Function
/*
Query the average population of all cities in CITY where District is California.
*/

SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California';

--004 Average Population
/*
Query the average population for all cities in CITY, rounded down to the nearest integer.
*/

SELECT ROUND(AVG(POPULATION))
FROM CITY;

--005- Japan Population
/*
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
*/

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';

--006- Population Density Difference
/*
Query the difference between the maximum and minimum populations in CITY.
*/

SELECT MAX(POPULATION) - MIN(POPULATION) AS DIFF
FROM CITY;


-- TBC
