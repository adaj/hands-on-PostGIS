--Q4: Inserting neighborhood(bairro) name on schools(escolas) table
ALTER TABLE escolasnatal
ADD COLUMN bairro varchar(100);
UPDATE escolasnatal e
SET bairro = subquery.bairro 
FROM (
	SELECT b.bairro, e.gid 
	FROM escolasnatal e 
	JOIN bairrosnatal b ON ST_Intersects(e.geom,b.geom)) AS subquery
WHERE e.gid = subquery.gid;
