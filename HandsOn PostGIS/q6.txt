--Q6: Create a new table with schools(escolas) clustering
CREATE TABLE clustescolas as
	SELECT row_number() over () AS id,
	  ST_NumGeometries(gc),
	  gc AS geom_collection,
	  ST_Centroid(gc) AS centroid,
	  ST_MinimumBoundingCircle(gc) AS circle,
	  sqrt(ST_Area(ST_MinimumBoundingCircle(gc)) / pi()) AS radius
	FROM (
	  SELECT unnest(ST_ClusterWithin(geom, 500)) gc
	  FROM escolasnatal
	) f;