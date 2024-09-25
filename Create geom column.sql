-- Version 1 
ALTER TABLE sagre_fiere
ADD COLUMN geom geometry(Point, 4326);

UPDATE sagre_fiere
SET geom = ST_SetSRID(ST_GeomFromText('POINT(' || geo_x || ' ' || geo_y || ')'), 4326);

SELECT * FROM sagre_fiere;


-- Version 2 
ALTER TABLE sagre_fiere
ADD COLUMN geom geometry(Point, 4326);

UPDATE sagre_fiere
SET geom = ST_SetSRID(ST_GeomFromText(location), 4326);

SELECT * FROM sagre_fiere;


