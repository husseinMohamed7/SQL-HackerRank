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


/*
The EMPLOYEES table is described as follows:
EMPLOYEES
ID             INTEGER
Name           STRING          
Salary         INTEGER
*/

--007- The Blunder
/*
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table,
but did not realize her keyboard's 0 key was broken until after completing the calculation.
She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.: actual - miscalcualted average monthly salaries), and round it up to the next integer.
*/

SELECT CEIL(AVG(salary) - AVG(REPLACE(CAST(salary AS CHAR), '0', '')))
FROM EMPLOYEES;

--008- Top Earners
/*
We define an employee's total earnings to be their monthly salaray*monthly worked,
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table.
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings.
Then print these values as 2 space-separated integers.
*/

SELECT MAX(months * salary) AS max_earnings,
       COUNT(employee_id) AS count_max_earners
FROM Employee
WHERE months * salary = (
    SELECT MAX(months * salary) FROM Employee);

/*
The STATIONN table is described as follows:
STATION
Field          Type
ID             NUMBER
CITY           VARCHAR2(21)          
STATE          VARCHAR2(2)
LAT_N          NUMBER
LONG_W         NUMBER
*/

--009- Weather Observation Station 2
/*
Query the following two values from the STATION table:
- The sum of all values in LAT_N rounded to a scale of 2 decimal places.
- The sum of all values in LONG_W rounded to a scale of 2 decimal places.
*/

SELECT ROUND(SUM(LAT_N),2), ROUND(SUM(LONG_W),2)
FROM STATION;

--010- Weather Observation Station 13
/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345.
Truncate your answer to 4 decimal places.
*/

SELECT ROUND(SUM(LAT_N),4)
FROM STATION
WHERe LAT_N > 38.7880  AND LAT_N < 137.2345;

--011- Weather Observation Station 14
/*
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345.
Truncate your answer to 4 decimal places.
*/

SELECT ROUND(MAX(LAT_N),4)
FROM STATION
WHERE LAT_N < 137.2345;


--012- Weather Observation Station 15
/*
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345.
Round your answer to 4 decimal places.
*/

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

--013- Weather Observation Station 16
/*
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7880.
Round your answer to 4 decimal places.
*/

SELECT ROUND(MIN(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7780;

--014- Weather Observation Station 16
/*
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7880.
Round your answer to 4 decimal places.
*/

SELECT ROUND(MIN(LAT_N),4)
FROM STATION
WHERE LAT_N > 38.7780;


--015- Weather Observation Station 17
/*
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7880.
Round your answer to 4 decimal places.
*/

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7880);

-- TBC
