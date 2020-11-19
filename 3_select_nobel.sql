-- 1	nobel Nobel Laureates
DESC nobel

-- 2	Winners from 1950
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 3	1962 Literature
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

-- 4	Albert Einstein
SELECT yr,subject FROM nobel
 WHERE winner = 'Albert Einstein'

-- 5	Recent Peace Prizes
SELECT winner FROM nobel
 WHERE subject = 'Peace' AND yr >= 2000

-- 6	Literature in the 1980's
SELECT yr, subject, winner FROM nobel
 WHERE subject ='Literature' AND yr >= 1980 AND yr <= 1989

-- 7	Only Presidents
SELECT * FROM nobel
  WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

-- 8	John
SELECT winner FROM nobel
 WHERE winner LIKE 'John %'

-- 9	Chemistry and Physics from different years
SELECT yr, subject, winner FROM nobel
 WHERE (subject = 'Physics' AND yr = 1980) OR
       (subject = 'Chemistry' AND yr = 1984)

-- 10	Exclude Chemists and Medics
SELECT yr, subject, winner FROM nobel
 WHERE (yr = 1980) AND
       (subject != 'Chemistry' AND subject != 'Medicine')

-- 11	Early Medicine, Late Literature
SELECT yr, subject, winner FROM nobel
 WHERE (subject = 'Medicine' AND yr < 1910) OR
       (subject = 'Literature' AND yr >= 2004)

-- 12	Harder Questions
-- 13	Umlaut
SELECT * FROM nobel
 WHERE winner = 'PETER GRÜNBERG'

-- 14	Apostrophe
SELECT * FROM nobel
 WHERE winner = 'EUGENE O''NEILL'

-- 15	Knights of the realm
SELECT winner, yr, subject FROM nobel
 WHERE winner LIKE 'Sir%'
 ORDER BY yr DESC, winner;

-- 16	Chemistry and Physics last
SELECT winner, subject FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics','Chemistry'),subject,winner
