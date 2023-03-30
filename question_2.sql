--2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?

SELECT namefirst||' '||namelast AS full_name,
	   height,
	   g_all AS games_played,
	   teams.name AS team_name 
  FROM people
  	   LEFT JOIN appearances USING(playerid)
	   LEFT JOIN teams USING(teamid, yearid)
 WHERE people.height = (SELECT MIN(height)
			    		FROM people);
						

--Eddie Gaedel, 43" tall, 1 game played with the St. Louis Browns.