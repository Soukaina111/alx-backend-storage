-- Lists all bands with 'Glam rock' as their main musical style
-- The bands are ranked by their longevity (lifespan in years)
-- The output columns are 'band_name' and 'lifespan' (in years)
-- The lifespan is computed using the 'formed' and 'split' attributes
-- The script can be executed on any database

SELECT band_name, COALESCE(split, 2022) - formed as lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
