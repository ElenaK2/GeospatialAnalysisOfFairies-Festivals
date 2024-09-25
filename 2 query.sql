SELECT prov, COUNT(*) AS numero_eventi
FROM sagre_fiere
GROUP BY prov
ORDER BY numero_eventi DESC
LIMIT 10;
