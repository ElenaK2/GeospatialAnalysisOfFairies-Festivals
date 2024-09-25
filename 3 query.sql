SELECT prov, COUNT(*) AS numero_sagre
FROM sagre_fiere
WHERE tipo = 'Sagra'
  AND prov IS NOT NULL
GROUP BY prov
ORDER BY numero_sagre DESC;