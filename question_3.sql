--3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?


SELECT namefirst||' '||namelast AS full_name, --Concat of namefirst, namelast to clean up result set
	   SUM(salary)::numeric::money AS career_salary 
  FROM salaries
  	   LEFT JOIN people USING (playerid) --Joining for name details
 WHERE playerid IN (SELECT playerid
	   			      FROM collegeplaying
				   	       LEFT JOIN schools USING(schoolid)
				     WHERE schoolname ILIKE 'vander%') --Filtering for player_ids that played for Vanderbilt.
 GROUP BY playerid, namefirst, namelast
 ORDER BY SUM(salary) DESC; 
 
-- David Price is the highest earning former Vanderbilt University player with a career salary of "$81,851,296.00". 
