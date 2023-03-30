--7.  From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? What is the smallest number of wins for a team that did win the world series? Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. Then redo your query, excluding the problem year. How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?

SELECT name, w, yearid
  FROM teams
 WHERE yearid BETWEEN 1970 AND 2016
	   AND wswin = 'N'
 ORDER BY w DESC; 
 
--(2001)Seattle Mariners have the highest number of wins (116) in a given season without a World Series win for the given dataset.

SELECT name, w, yearid
  FROM teams
 WHERE yearid BETWEEN 1970 AND 2016
 	   AND wswin = 'Y' AND yearid <> 1981
 ORDER BY w;
 
--(1981)Los Angeles Dodgers have the lowest number of wins (63) in a given season with a World Series win for the given dataset. 
--In 1981 there was a strike in the MLB causing the season to be shortened, this resulted in an unusually low number of games played compared to other seasons. 
  --Excluding 1981 due to the strike, (2006)St. Louis Cardinals have the lowest number of wins (83) in a given season with a World Series win for the given dataset.

WITH cte AS (SELECT yearid, teamid, w, wswin,
		   			MAX(w) OVER(PARTITION BY yearid) AS most_wins_year
 			   FROM teams
	    	  WHERE yearid BETWEEN 1970 AND 2016)
			  
SELECT SUM(CASE WHEN wswin = 'Y' AND w = most_wins_year THEN 1 END) AS wswin_maxwins,
	   ROUND(SUM(CASE WHEN wswin = 'Y' AND w = most_wins_year THEN 1 END)::numeric/SUM(CASE WHEN wswin = 'Y' THEN 1 END)*100, 2)||'%' AS percent
  FROM cte;

--World Series winners have the most wins of the season 26.09% of the time. 
