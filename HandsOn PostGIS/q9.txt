--Q9: Measuring how many % of streets(logradouros) does have schools(escolas) on a maximum of 50 meters of distance
WITH logtotal AS(
select count(ll.*) as tot from logradourosnatal ll
)
SELECT count(distinct l.geom)::numeric/(SELECT tot FROM logtotal)::numeric as porcentage
FROM escolasnatal e
JOIN logradourosnatal l 
ON ST_DWithin(e.geom,l.bgeom,50);