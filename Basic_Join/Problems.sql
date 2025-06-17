
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

/*
The COUNTRY table is described as follows:
COUNTRY
Field          Type
CODE           VARCHAR2(3)
CONTINENT      VARCHAR2(3)
*/


--001- Population Census
/*
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT SUM(CITY.POPULATION)
FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.Continent = 'Asia';

--002- African Cities   
/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT (CITY.NAME)
FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Africa';

--003- Average Population of Each Continent
/*
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) 
and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
*/

SELECT COUNTRY.Continent, FLOOR(AVG(CITY.Population))
FROM COUNTRY, CITY
WHERE COUNTRY.Code = CITY.CountryCode
GROUP BY COUNTRY.Continent;
