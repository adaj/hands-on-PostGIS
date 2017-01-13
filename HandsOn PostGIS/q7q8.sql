--Q7: Creating a new column with schools(escolas) points buffered by 5 meters
ALTER TABLE escolasnatal
ADD bgeom geometry;
UPDATE escolasnatal
SET bgeom = ST_Buffer(geom, 50, 'quad_segs=8')

--Q8: Creating a new column with streets(logradouros) buffered by 5 meters
ALTER TABLE logradourosnatal
ADD bgeom geometry;
UPDATE logradourosnatal
SET bgeom = ST_Buffer(geom, 5, 'endcap=flat join=round')

