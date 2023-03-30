--10. Find all players who hit their career highest number of home runs in 2016. Consider only players who have played in the league for at least 10 years, and who hit at least one home run in 2016. Report the players' first and last names and the number of home runs they hit in 2016.

WITH players2016 AS (SELECT playerid, hr AS homeruns2016
			           FROM batting
		              WHERE yearid = 2016 AND hr >= 1), --Selecting players with at least one homerun in 2016. 


	   yrsplayed AS (SELECT playerid, namefirst, namelast, (finalgame::date - debut::date)/365 AS yearsplayed
				       FROM people), --Establishing years played.
	 
	    careerhr AS (SELECT playerid, MAX(hr) AS careermaxhr
				       FROM batting
				      GROUP BY playerid) --Totalling career homeruns.

SELECT namefirst||' '||namelast AS full_name,
	   homeruns2016
  FROM players2016
	   LEFT JOIN yrsplayed
	   USING(playerid)
	   LEFT JOIN careerhr
	   USING(playerid)
 WHERE homeruns2016 = careermaxhr AND yearsplayed >= 9
 ORDER BY homeruns2016 DESC;
 
-- Edwin Encarnacion(42), Robinson Cano(39), Mike Napoli(34), Rajai Davis(12), Angel Pagan(12), Adam Wainwright(2), Francisco Liriano(1), Bartolo Colon(1)
   --Note: one player, Justin Upton has 10 distinct yearids listed in the table but hasn't played for a total time of 10 years. If you were interested in players that have 			played in 10 different years, you could alter the CTE yrsplayed to replace my initial calculation with one that reads "COUNT(DISTINCT yearid)". This returns all players 		 who have played IN 10 different years. This may or may not be a more accurate solution depending on your end goal. 