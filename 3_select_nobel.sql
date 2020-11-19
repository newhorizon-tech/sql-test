-- 1	nobel Nobel Laureates

nobel(yr, subject, winner)

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
-- 5	Recent Peace Prizes
-- 6	Literature in the 1980's
-- 7	Only Presidents
-- 8	John
-- 9	Chemistry and Physics from different years
-- 10	Exclude Chemists and Medics
-- 11	Early Medicine, Late Literature
-- 12	Harder Questions
-- 13	Umlaut
-- 14	Apostrophe
-- 15	Knights of the realm
-- 16	Chemistry and Physics last
