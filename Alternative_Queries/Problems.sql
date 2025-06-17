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


--003- Print Prime Numbers
/*
Write a query to print all prime numbers less than or equal to 1000, & as a separator. 2&3&5
*/

WITH RECURSIVE numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1 FROM numbers WHERE n + 1 <= 1000
),
primes AS (
    SELECT n FROM numbers AS n1
    WHERE NOT EXISTS (
        SELECT 1 FROM numbers AS n2
        WHERE n2.n < n1.n AND n2.n > 1 AND n1.n % n2.n = 0
    )
)
SELECT GROUP_CONCAT(n SEPARATOR '&') AS prime_list
FROM primes;
