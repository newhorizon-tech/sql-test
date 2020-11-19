-- 1	1962 movies
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2	When was Citizen Kane released?
SELECT yr FROM movie
 WHERE title='Citizen Kane'

-- 3	Star Trek movies
SELECT id, title, yr FROM movie
 WHERE title LIKE 'Star Trek%'
ORDER BY yr

-- 4	id for actor Glenn Close
SELECT id FROM actor
 WHERE name = 'Glenn Close'

-- 5	id for Casablanca
SELECT id FROM movie
 WHERE title = 'Casablanca'

-- 6	Cast list for Casablanca
SELECT name
FROM movie
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
 WHERE movieid=11768

-- 7	Alien cast list
SELECT name
FROM movie
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
 WHERE title='Alien'

-- 8	Harrison Ford movies
SELECT title
FROM movie
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
 WHERE name = 'Harrison Ford'

-- 9	Harrison Ford as a supporting actor
SELECT title
FROM movie
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
 WHERE name = 'Harrison Ford' AND ord!=1

-- 10	Lead actors in 1962 movies
SELECT title, name
FROM movie
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
 WHERE yr=1962 AND ord=1

-- 11	Busy years for Rock Hudson
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12	Lead actor in Julie Andrews movies
SELECT title, name
FROM movie
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
 WHERE movieid in (SELECT movieid FROM casting
JOIN movie ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews')) AND ord=1

-- 13	Actors with 15 leading roles
SELECT name
FROM movie
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
 WHERE ord=1
GROUP BY name HAVING count(title) >=15
-- 14 List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

SELECT title, count(actorid)
FROM movie
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
 WHERE yr=1978
GROUP BY title
ORDER BY count(actorid) DESC, title

-- List all the people who have worked with 'Art Garfunkel'.

SELECT name from actor
WHERE name != 'Art Garfunkel' AND id IN
(SELECT actorid from casting
WHERE movieid IN
(SELECT movieid
FROM movie
JOIN casting ON (movie.id=movieid)
JOIN actor ON (actor.id=actorid)
 WHERE name = 'Art Garfunkel'))
