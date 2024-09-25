SELECT prov, COUNT(*) AS numero_fiere
FROM sagre_fiere
WHERE tipo = 'Fiera'
  AND prov IS NOT NULL
  AND prov <> ''
GROUP BY prov
ORDER BY numero_fiere DESC;