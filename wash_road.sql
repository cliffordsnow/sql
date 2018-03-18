CREATE OR REPLACE VIEW public.washington_roads AS 
 SELECT 'Whatcom'::text AS county,
    format_road(whatcom_roads.st_prefix, whatcom_roads.st_name, whatcom_roads.st_type, whatcom_roads.st_suffix) AS street,
    whatcom_roads.geom
   FROM whatcom_roads
UNION
 SELECT 'Skagit'::text AS county,
    initcap(skagit_roads.roadname::text) AS street,
    skagit_roads.geom
   FROM skagit_roads
UNION
 SELECT 'San Juan'::text AS county,
    sanj_roads.street,
    sanj_roads.geom
   FROM sanj_roads
UNION
 SELECT 'Kittitas'::text AS county,
    kittitas_roads.atlas AS street,
    kittitas_roads.geom
   FROM kittitas_roads
UNION
 SELECT 'Kitsap'::text AS county,
	format(prefix,streetname,streettype, suffix) AS street,
	geom
 FROM kitsap_roads
UNION 
 SELECT 'Island'::text AS county,
    island_roads.street,
    island_roads.geom
   FROM island_roads
UNION
 SELECT 'Grant'::text AS county,
    grant_co_roads.fullname AS street,
    grant_co_roads.geom
   FROM grant_co_roads
UNION
 SELECT 'Franklin'::text AS county,
    format_road(franklin_roads.sdirpre, franklin_roads.sfeanme, franklin_roads.sfeatyp, franklin_roads.sdirsuf) AS street,
    franklin_roads.geom
   FROM franklin_roads
UNION
 SELECT 'Snohomish'::text AS county,
    format_road(snoh_roads.prefix, snoh_roads.name, snoh_roads.type, snoh_roads.suffix) AS street,
    snoh_roads.geom
   FROM snoh_roads
UNION
 SELECT 'Douglas'::text AS county,
    format_road(douglas_roads.str_pre, douglas_roads.str_name, douglas_roads.str_type, douglas_roads.str_suf) AS street,
    douglas_roads.geom
   FROM douglas_roads
  WHERE douglas_roads.roadtype::text <> 'Proposed'::text
UNION
 SELECT 'Chelan'::text AS county,
    chelan_roads.fullname AS street,
    chelan_roads.geom
   FROM chelan_roads
  WHERE chelan_roads.status::text = ANY (ARRAY['As-built'::character varying::text, 'Other'::character varying::text])
UNION
select 'King'::text as county,format_road(prefix_l,name_l,type_l,suffix_l) as street,geom from king_roads where fullname_l = fullname_r and name_l != 'Unnamed'
union
select 'King'::text as county,concat('Left = ',format_road(prefix_l,name_l,type_l,suffix_l),' Right = ',format_road(prefix_r,name_r,type_r,suffix_r)) as street, geom from king_roads
   where fullname_l != fullname_r
union
select 'King'::text as county,''::varchar as street,geom from king_roads where  name_l = 'Unnamed'
UNION
 SELECT 'Pierce'::text AS county,
    format_road(pierce_roads.predir, pierce_roads.name, pierce_roads.type, pierce_roads.sufdir) AS street,
    pierce_roads.geom
   FROM pierce_roads
UNION
 SELECT 'Okanogan'::text AS county,
    format_road(okanogan_roads.direction, okanogan_roads.name, okanogan_roads.type, okanogan_roads.sufdir) AS street,
    okanogan_roads.geom
   FROM okanogan_roads;

ALTER TABLE public.washington_roads
  OWNER TO postgres;
GRANT ALL ON TABLE public.washington_roads TO postgres;
GRANT ALL ON TABLE public.washington_roads TO public;
