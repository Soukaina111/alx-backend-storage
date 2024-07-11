-- Writes an SQL script that ranks the country origins of bands
-- The ranking is ordered by the number of (non-unique) fans for each country
-- The output columns are 'origin' and 'nb_fans'
-- The script can be executed on any database

SELECT origin, SUM(fans) as nb_fans 
FROM metal_bands
GROUP BY origin
ORDER BY nb_fans DESC;
