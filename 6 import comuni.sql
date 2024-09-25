ALTER TABLE sagre_fiere
ADD COLUMN durata integer;

UPDATE sagre_fiere
SET durata = 
    (TO_DATE(data_fine, 'DD/MM/YYYY') - TO_DATE(data_in, 'DD/MM/YYYY'))

SELECT comune, TO_DATE(data_in, 'DD/MM/YYYY'), ora_in, TO_DATE(data_fine, 'DD/MM/YYYY')AS data_fine,
	   ora_fine, durata, denom, tipo,somminis,geom
FROM sagre_fiere
WHERE tipo IN ('Sagra', 'Fiera')
  AND TO_DATE(data_in, 'DD/MM/YYYY') BETWEEN '2024-09-01' AND '2024-09-30'
  AND prov = 'BG'
ORDER BY TO_DATE(data_in, 'DD/MM/YYYY'), ora_in;

