--5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends?

WITH pitchingdecade AS (SELECT (yearid/10*10)::text||'''s' AS decade,
	   				   		   so::numeric AS strikeouts,
	   				   		   hr::numeric AS homeruns,
	   				   		   g AS games
						  FROM teams
						 WHERE yearid >= 1920) --Creating a table of the relevant information
						 
SELECT decade,
	   ROUND(SUM(strikeouts)/(SUM(games)/2), 2) AS avg_strikeouts,
	   ROUND(SUM(homeruns)/(SUM(games)/2), 2) AS avg_homeruns --Dividing the SUM of games by 2, as each game must be represented by two teams in the teams table. 
FROM pitchingdecade
GROUP BY decade
ORDER BY decade;

--Average strikeouts and average homeruns have steadily increased since the 1920's.




