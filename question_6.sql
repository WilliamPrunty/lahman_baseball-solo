--6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.

SELECT namefirst||' '||namelast AS player,	   
	   ROUND(SUM(sb)/SUM(sb+cs)::numeric*100, 2)||'%' AS success
  FROM batting
	   LEFT JOIN people USING(playerid) --Joining for relevant player information. 
 WHERE sb + cs >= 20 AND yearid = 2016 --Filtering for greater than 20 attempts and only the year 2016.
 GROUP BY playerid, namefirst, namelast
 ORDER BY success DESC;
 
 --Chris Owings had the most success stealing bases in 2016, with a 91.3% chance.