--4. Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these three groups in 2016.

WITH putouts AS (SELECT  
	   					CASE WHEN pos = 'OF' THEN 'outfield'
	   	    				 WHEN pos IN ('SS', '1B', '2B', '3B') THEN 'infield' 
							 WHEN pos IN ('P', 'C') THEN 'battery' END AS position,
	   					po AS putouts
				   FROM fielding
				  WHERE yearid = 2016) --categorizing positions and selecting data from only the year 2016.

SELECT position,
	   SUM(putouts) AS total_putouts
  FROM putouts
 GROUP BY position
 ORDER BY SUM(putouts) DESC;
 
--infield(58934), battery(41424), outfield(29560)
