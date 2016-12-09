--Q0: Importing schools data
CREATE TABLE escolasnatal
(
  gid integer NOT NULL,
  nome varchar(100),			--optional (depends on data)
  dep_insti varchar(100),		 		--optional
  lat double precision,
  lon double precision,
  geom geometry,
  CONSTRAINT points_pkey PRIMARY KEY (gid),
  CONSTRAINT enforce_dims_geom CHECK (st_ndims(geom) = 2),
  CONSTRAINT enforce_geotype_geom CHECK (geometrytype(geom) = 'POINT'::text OR geom IS NULL)
);

CREATE INDEX escolasnatal_geom_gist
  ON escolasnatal
  USING gist
  (geom);
  
COPY escolasnatal(gid, nome, dep_insti, lat, lon) FROM 'C:\escolasNatal.csv' DELIMITERS ',' ;

UPDATE escolasnatal
SET geom = ST_GeomFromText('POINT(' || lon || ' ' || lat || ')',4326);

--Q1: transform srid to 31985
UPDATE escolasnatal SET geom = st_transform(geom, 31985);
