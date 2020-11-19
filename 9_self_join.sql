-- How many stops are in the database.
SELECT COUNT(id) from stops

-- Find the id value for the stop 'Craiglockhart'
SELECT id from stops
 WHERE name = 'Craiglockhart'
-- Give the id and the name for the stops on the '4' 'LRT' service.
SELECT s.id, s.name from stops s
JOIN route r ON (s.id = r.stop)
 WHERE r.num = '4' AND r.company='LRT'

-- Run the query and notice the two services that link these stops have a count of 2.
-- Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2

-- Change the query so that it shows the services from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop=149

-- Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

-- Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b
ON (a.company = b.company AND a.num = b.num)
JOIN stops stop_a ON (a.stop=stop_a.id)
JOIN stops stop_b ON (b.stop=stop_b.id)
 WHERE stop_a.id=115 AND stop_b.id=137

-- Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b
ON (a.company = b.company AND a.num = b.num)
JOIN stops stop_a ON (a.stop=stop_a.id)
JOIN stops stop_b ON (b.stop=stop_b.id)
 WHERE stop_a.name='Craiglockhart' AND stop_b.name='Tollcross'

-- Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company.
-- Include the company and bus no. of the relevant services.
SELECT DISTINCT stop_b.name, b.company, b.num
FROM route a JOIN route b
ON (a.company = b.company AND a.num = b.num)
JOIN stops stop_a ON (a.stop=stop_a.id)
JOIN stops stop_b ON (b.stop=stop_b.id)
 WHERE stop_a.name='Craiglockhart' AND a.company = 'LRT'

-- Find the routes involving two buses that can go from Craiglockhart to Lochend.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer,
-- and the bus no. and company for the second bus.

SELECT DISTINCT craig.num,craig.company,stops.name,loch.num,loch.company
FROM
(
SELECT route_1.num,route_1.company,route_2.stop
FROM
route route_1 JOIN route route_2 ON(route_1.num = route_2.num AND route_1.company=route_2.company)
JOIN stops s ON (route_1.stop = s.id AND s.name='Craiglockhart')
) AS craig

JOIN

(
SELECT route_1.num,route_1.company,route_2.stop
FROM
route route_1 JOIN route route_2 ON(route_1.num = route_2.num AND route_1.company=route_2.company)
JOIN stops s ON (route_1.stop = s.id AND s.name='Lochend')
) AS loch

ON craig.stop = loch.stop
JOIN stops ON craig.stop = stops.id /*get transfer nodes' name*/
