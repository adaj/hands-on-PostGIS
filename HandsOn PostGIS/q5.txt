--Q5: Measuring how far are schools(escolas) from each other in all neighborhoods(bairros)
SELECT  eb.bairro, avg(ST_Distance(eb.geom, eeb.geom)) AS distancia_media_ocorrencias
FROM	(
	SELECT e.gid, e.geom, b.bairro
	FROM escolasnatal e
	JOIN bairrosnatal b ON ST_Intersects(e.geom,b.geom)
	) eb, 
	(
	SELECT e.gid, e.geom, b.bairro
	FROM escolasnatal e
	JOIN bairrosnatal b ON ST_Intersects(e.geom,b.geom)
	) eeb
WHERE eb.gid!=eeb.gid AND eb.bairro=eeb.bairro
GROUP BY eb.bairro
