-- Query 1: 

SELECT prov, COUNT(*) AS n_events
FROM sagre_fiere
GROUP BY prov
ORDER BY n_events DESC
LIMIT 10;

-- Query 2:
SELECT
    (SELECT COUNT(*) FROM sagre_fiere) AS total_events,
    COUNT(*) AS events_with_website,
    ROUND((COUNT(*) / (SELECT COUNT(*) FROM sagre_fiere) * 100), 2) AS digitalization_percentage
FROM sagre_fiere
WHERE sito_web IS NOT NULL AND sito_web <> '';

-- Query 3:
SELECT 
    comune, 
    COUNT(*) AS n_events,
    SUM(CASE WHEN tipo = 'Sagra' THEN 1 ELSE 0 END) AS sagre,
    SUM(CASE WHEN tipo = 'Fiera' THEN 1 ELSE 0 END) AS fiere
FROM sagre_fiere
GROUP BY comune
ORDER BY n_events DESC
LIMIT 10;


-- Query 4:
ALTER TABLE sagre_fiere
ADD COLUMN duration INT;

UPDATE sagre_fiere
SET duration = DATEDIFF(STR_TO_DATE(data_fine, '%d/%m/%Y'), STR_TO_DATE(data_in, '%d/%m/%Y'));


SELECT 
    tipo, 
    ROUND(AVG(duration), 1) AS avg_duration_in_days
FROM sagre_fiere
GROUP BY tipo;

--- Query 5:
UPDATE sagre_fiere
SET 
    data_in_date = STR_TO_DATE(data_in, '%d/%m/%Y'),
    data_fine_date = STR_TO_DATE(data_fine, '%d/%m/%Y');

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sagre_fiere'
AND column_name IN ('data_in', 'data_in_date', 'data_fine', 'data_fine_date');


SELECT
    denom,
    comune,
    tipo,
    prov,
    ST_Distance_Sphere(
        POINT(CAST(geo_x AS DECIMAL(10, 6)), CAST(geo_y AS DECIMAL(10, 6))),
        POINT(9.6602, 45.6918)
    ) AS distanza_in_metri,
    CONCAT('POINT(', geo_x, ' ', geo_y, ')') AS geom,
    data_in_date,
    ora_in,
    data_fine_date,
    ora_fine
FROM sagre_fiere
WHERE ST_Distance_Sphere(
        POINT(CAST(geo_x AS DECIMAL(10, 6)), CAST(geo_y AS DECIMAL(10, 6))),
        POINT(9.6602, 45.6918)
    ) <= 15000
AND (
    (data_in_date BETWEEN '2024-09-01' AND '2024-12-31')
    OR (data_fine_date BETWEEN '2024-09-01' AND '2024-12-31')
    OR (data_in_date <= '2024-12-31' AND data_fine_date >= '2024-09-01')
)
ORDER BY distanza_in_metri;


ALTER TABLE sagre_fiere
ADD COLUMN geom POINT;

UPDATE sagre_fiere
SET geom = ST_GeomFromText(CONCAT('POINT(', geo_x, ' ', geo_y, ')'), 4326);


ALTER TABLE sagre_fiere
ADD COLUMN data_in_date DATE,
ADD COLUMN data_fine_date DATE;

UPDATE sagre_fiere
SET 
    data_in_date = STR_TO_DATE(data_in, '%d/%m/%Y'),
    data_fine_date = STR_TO_DATE(data_fine, '%d/%m/%Y');

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sagre_fiere'
AND column_name IN ('data_in', 'data_in_date', 'data_fine', 'data_fine_date');


