-- 1. Query all columns for all American cities in the CITY table with populations larger than
--  100000. The CountryCode for America is USA.
SELECT
    *
FROM
    city
WHERE
    population > 100000
    AND
    countrycode = 'USA';

-- 2. Query the NAME field for all American cities in the CITY table with populations larger than 
-- 120000. The CountryCode for America is USA.
SELECT
    name
FROM 
    city
WHERE
    population > 120000
    AND
    countrycode = 'USA';

-- 3. Query all columns (attributes) for every row in the CITY table.
SELECT
    *
FROM
    city;

-- 4. Query all columns for a city in CITY with the ID 1661.
SELECT
    *
FROM
    city
WHERE
    id = 1661;

-- 5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is 
-- JPN.
SELECT
    *
FROM
    city
WHERE
    countrycode = 'JPN';

-- 6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is 
-- JPN.
SELECT
    name
FROM
    city
WHERE
    countrycode = 'JPN';

-- 7. Query a list of CITY and STATE from the STATION table.
SELECT
    city, state
FROM 
    station;

-- 8. Query a list of CITY names from STATION for cities that have an even ID number. Print the
--  results in any order, but exclude duplicates from the answer
SELECT
    DISTINCT(city)
FROM
    station
WHERE
    id % 2 =0;

-- 9. Find the difference between the total number of CITY entries in the table and the number
--  of distinct CITY entries in the table.
 SELECT
    COUNT(city) - COUNT(DISTINCT(city))
FROM
    station;

-- 10. Query the two cities in STATION with the shortest and longest CITY names, as well as their
-- respective lengths  (i.e.: number of characters in the name). If there is more than one smallest
-- or largest city, choose the one that comes first when ordered alphabetically.
SELECT
    city, LENGTH(city)
FROM
    station
WHERE LENGTH(city) = (
    SELECT MIN(LENGTH(city))
    FROM STATION)
    OR
    LENGTH(city) = (
    SELECT MAX(LENGTH(city))
    FROM STATION)
ORDER BY LENGTH(city) DESC, city ASC
LIMIT 2;

-- 11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
-- Your result cannot contain duplicates.

SELECT
    DISTINCT(city)
FROM
    station
WHERE
    city LIKE 'a%' OR
    city LIKE 'e%' OR
    city LIKE 'i%' OR
    city LIKE 'o%' OR
    city LIKE 'u%';

-- 12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result
-- cannot contain duplicates
SELECT
    DISTINCT(city)
FROM
    station
WHERE
    city LIKE '%a' OR
    city LIKE '%e' OR
    city LIKE '%i' OR
    city LIKE '%o' OR
    city LIKE '%u';

-- 13. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as 
-- both their first and last characters. Your result cannot contain duplicates.
SELECT
    DISTINCT(city)
FROM 
    station
WHERE
    city RLIKE '^[AEIOU].*[AEIOU]$';

-- 14 Query the list of CITY names from STATION that do not start with vowels. Your result cannot 
-- contain duplicates.
SELECT
    DISTINCT(city)
FROM 
    station
WHERE
    city NOT RLIKE '^[AEIOUaeiou].*$';

-- 15. Query the list of CITY names from STATION that do not end with vowels. Your result cannot 
-- contain duplicates.
SELECT
    DISTINCT(city)
FROM
    station
WHERE
    city NOT RLIKE '[aeiou]$';

-- 16. Query the list of CITY names from STATION that either do not start with vowels or do not 
-- end with vowels. Your result cannot contain duplicates.
SELECT
    DISTINCT(city)
FROM 
    station
WHERE
    REGEXP_LIKE(city, '^[^AEIOUaeiou]|[^AEIOUaeiou]$');

-- 17. Query the list of CITY names from STATION that do not start with vowels and do not end with 
-- vowels. Your result cannot contain duplicates.
SELECT
    DISTINCT(city)
FROM 
    station
WHERE
    REGEXP_LIKE(city, '^[^AEIOUaeiou].*[^AEIOUaeiou]$');

-- 18. Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output
-- by the last three characters of each name. If two or more students both have names ending in the
-- same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID

SELECT
    name
FROM
    students
WHERE
    marks > 75
ORDER BY
    RIGHT(name,3), id asc;

-- 19. Write a query that prints a list of employee names (i.e.: the name attribute) from the 
-- Employee table in alphabetical order.

SELECT
    name
FROM
    Employee
ORDER BY
    name ASC;

-- 20. Write a query that prints a list of employee names (i.e.: the name attribute) for employees
-- in Employee having a salary greater than per month who have been employees for less than  
-- months. Sort your result by ascending employee_id.
SELECT
    name
FROM
    Employee
WHERE
    salary > 2000
    AND
    months < 10;

-- 21 Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less 
-- than . Truncate your answer to  decimal places.
SELECT
    ROUND(SUM(LAT_N), 4)
FROM 
    STATION
WHERE
    LAT_N BETWEEN 38.7880 AND 137.2345;

-- 22. Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than .
--  Truncate your answer to  decimal places.
SELECT
    ROUND(MAX(LAT_N), 4)
FROM
    STATION
WHERE
    LAT_N < 137.2345;

-- 23. Query a count of the number of cities in CITY having a Population larger than .
SELECT
    COUNT(NAME)
FROM
    CITY
WHERE
    POPULATION > 100000;

-- 24. Query the total population of all cities in CITY where District is California.
SELECT
    SUM(POPULATION)
FROM
    CITY
WHERE
    DISTRICT = 'California';
-- 25. Query the average population of all cities in CITY where District is California.
SELECT
    AVG(POPULATION)
FROM
    CITY
WHERE
    DISTRICT = 'California';
-- 26. Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT
    FLOOR(AVG(POPULATION))
FROM
    CITY;
-- 27. Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan 
-- is JPN.
SELECT
    SUM(POPULATION)
FROM
    CITY
WHERE
    COUNTRYCODE = 'JPN';
-- 28- Query the difference between the maximum and minimum populations in CITY.
SELECT
    MAX(POPULATION) - MIN(POPULATION)
FROM
    CITY;
-- 29. Query the following two values from the STATION table:
-- The sum of all values in LAT_N rounded to a scale of  decimal places.
-- The sum of all values in LONG_W rounded to a scale of  decimal places.
SELECT
    ROUND(SUM(LAT_N), 2),
    ROUND(SUM(LONG_W), 2)
FROM
    STATION;
-- 30. Query the smallest Northern Latitude (LAT_N) from STATION that is greater than . Round your answer to  decimal places.
SELECT
    ROUND(MIN(LAT_N), 4)
FROM
    STATION
WHERE
    LAT_N > 38.7780;

-- 31. Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than . 
-- Round your answer to  decimal places.
SELECT
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    LAT_N = (SELECT MAX(LAT_N)
            FROM STATION   
            WHERE LAT_N < 137.2345); 
-- 32. Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than . 
-- Round your answer to  decimal places.
SELECT
    ROUND(LONG_W, 4)
FROM STATION
WHERE
    LAT_N = (SELECT MIN(LAT_N)
            FROM STATION
            WHERE LAT_N > 38.7780);

-- 33. Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output 
-- one of the following statements for each record in the table:
-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths. 
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT
    CASE
    WHEN (A + B)<= C OR (B+C)<=A OR (A+C)<= B THEN 'Not A Triangle'
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A = B OR B = C OR A = C THEN 'Isosceles'
    ELSE 'Scalene'
    END
FROM 
    TRIANGLES;

-- 34. Consider P1(a,b)  and P2(c,d) to be two points on a 2D plane.
-- happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
-- happens to equal the minimum value in Western Longitude (LONG_W in STATION).
-- happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
-- happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points  and  and round it to a scale of  decimal places. 

WITH CALC_DISTANCE AS
    (SELECT
        MIN(LAT_N) AS a,
        MIN(LONG_W) AS b,
        MAX(LAT_N) AS c,
        MAX(LONG_W) AS d
    FROM
        STATION
    )
SELECT
    ROUND(((ABS(c - a)) + (ABS( d - b))), 4)
FROM
    CALC_DISTANCE;
-- 35. Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) are the respective 
-- minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and 
-- maximum values of Western Longitude (LONG_W) in STATION.
-- Query the Euclidean Distance between points P1 and P2 and format your answer to display  decimal 
-- digits.
WITH CALC_DISTANCE AS
    (SELECT
        MIN(LAT_N) AS a,
        MAX(LAT_N) AS b,   
        MIN(LONG_W) AS c,        
        MAX(LONG_W) AS d
    FROM
        STATION
    )
SELECT
    ROUND(
        (SQRT(
            POWER(
                ABS((b - a)), 2) + 
            POWER(
                ABS((d - c)),2)
        )),4)
FROM
    CALC_DISTANCE;

-- 36. A median is defined as a number separating the higher half of a data set from the lower half. 
-- Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal 
-- places.
SET @row_index:= -1;

SELECT 
    ROUND(AVG(LAT_N), 4)
FROM
    (SELECT
        @row_index:= @row_index + 1 AS row_index,
        LAT_N
    FROM
        STATION
    ORDER BY
        LAT_N) AS SubQuery
WHERE
    SubQuery.row_index IN (FLOOR (@row_index / 2), CEIL(@row_index / 2));
