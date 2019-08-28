CREATE OR REPLACE VIEW public.okanogan_road_view AS 
 SELECT okanogan_roads.gid,
	CASE 
		when okanogan_roads.rd_type = 'B' then 
		  concat(format_road(okanogan_roads.direction, okanogan_roads.name, okanogan_roads.type, okanogan_roads.sufdir),' - ','BIA') 
		when okanogan_roads.rd_type = 'D' then
		  concat(format_road(okanogan_roads.direction, okanogan_roads.name, okanogan_roads.type, okanogan_roads.sufdir),' - ','DNR') 
		when okanogan_roads.rd_type = 'F' then
		  concat(format_road(okanogan_roads.direction, okanogan_roads.name, okanogan_roads.type, okanogan_roads.sufdir),' - ','USFS') 
		when okanogan_roads.rd_type = 'P' then
		  concat(format_road(okanogan_roads.direction, okanogan_roads.name, okanogan_roads.type, okanogan_roads.sufdir),' - ','Private') 
		when okanogan_roads.rd_type = 'R' then
		  concat(format_road(okanogan_roads.direction, okanogan_roads.name, okanogan_roads.type, okanogan_roads.sufdir),' - ','Railroad') 
	ELSE
		format_road(okanogan_roads.direction, okanogan_roads.name, okanogan_roads.type, okanogan_roads.sufdir)
	END AS street,
        CASE
            WHEN okanogan_roads.surface::text = 'D'::text OR okanogan_roads.surface::text = 'd'::text THEN 'ground'::text
            WHEN okanogan_roads.surface::text = 'P'::text THEN 'paved'::text
            WHEN okanogan_roads.surface::text = 'G'::text THEN 'gravel'::text
            ELSE ''::text
        END AS surface,
    okanogan_roads.geom
   FROM okanogan_roads;

ALTER TABLE public.okanogan_road_view
  OWNER TO clifford;

