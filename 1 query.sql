SELECT tipo, COUNT(*) AS numero_eventi
FROM sagre_fiere
GROUP BY tipo;
