-- 1	World Country Profile: Aggregate functions

-- COUNT, SUM and AVG are aggregate functions.
-- An aggregate function takes many values and delivers just one value.
-- For example the function SUM would aggregate the values 2, 4 and 5 to deliver the single value 11.


-- 2	Using SUM, Count, MAX, DISTINCT and ORDER BY

-- The functions SUM, COUNT, MAX and AVG are "aggregates", each may be applied to a numeric attribute resulting in a single row being returned by the query. (These functions are even more useful when used with the GROUP BY clause.)

-- 3	Total world population
SELECT SUM(population)
FROM world

-- 4	List of continents
SELECT DISTINCT(continent) FROM world

-- 5	GDP of Africa
SELECT SUM(gdp) FROM world
 WHERE continent = 'Africa'

-- 6	Count the big countries
SELECT COUNT(name) from world
 WHERE area >= 1000000

-- 7	Baltic states population
SELECT SUM(population) from world
 WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- 8	Using GROUP BY and HAVING
-- 9	Counting the countries of each continent
SELECT continent, count(name) FROM world GROUP BY continent

-- 10	Counting big countries in each continent
SELECT continent, count(name) FROM world
 WHERE population >= 10000000
GROUP BY continent

-- 11	Counting big continents
SELECT continent FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000
