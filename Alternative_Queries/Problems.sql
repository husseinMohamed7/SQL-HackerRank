--001- Draw The Triangle 1
/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20).
*/

WITH RECURSIVE pattern(n) AS (
    SELECT 20
    UNION ALL
    SELECT n - 1
    FROM pattern
    WHERE n > 1
)
SELECT REPEAT('* ', n) AS line
FROM pattern;
--002- Draw The Triangle 2
/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).
*/

WITH RECURSIVE pattern(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1
    FROM pattern
    WHERE n < 20
)
SELECT REPEAT('* ', n) AS line
FROM pattern;
