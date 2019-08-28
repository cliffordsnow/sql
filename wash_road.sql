CREATE OR REPLACE VIEW public.wa_county_roads AS 
 SELECT 'Benton'::text AS county,
    format_road(benton_roads.prefix, benton_roads.name, benton_roads.type, benton_roads.suffix) AS street,
    benton_roads.geom
   FROM benton_roads
UNION
 SELECT 'Clallam'::text AS county,
    format_road(clallam_roads.rd_dir, clallam_roads.rd_name, clallam_roads.rd_type, ''::character varying) AS street,
    clallam_roads.geom
   FROM clallam_roads
  WHERE clallam_roads.pre_type IS NULL
UNION
 SELECT 'Clallam'::text AS county,
    concat('Highway ', clallam_roads.rd_name) AS street,
    clallam_roads.geom
   FROM clallam_roads
  WHERE clallam_roads.pre_type IS NOT NULL
UNION
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
 SELECT 'Wahkiakum'::text AS county,
    format_road(wahkiakum_roads.roadpredir, wahkiakum_roads.roadname, wahkiakum_roads.roadtype, wahkiakum_roads.roadpostdi) AS street,
    wahkiakum_roads.geom
   FROM wahkiakum_roads
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
 SELECT 'WallaWalla'::text AS county,
    format_road(wallawalla_roads.sd, wallawalla_roads.sn, wallawalla_roads.st, wallawalla_roads.sd) AS street,
    wallawalla_roads.geom
   FROM wallawalla_roads
  WHERE wallawalla_roads.pt IS NULL
UNION
 SELECT 'WallaWalla'::text AS county,
    wallawalla_roads.alias_1 AS street,
    wallawalla_roads.geom
   FROM wallawalla_roads
  WHERE wallawalla_roads.pt IS NOT NULL
UNION
 SELECT 'Lewis'::text AS county,
    format_road(lewis_roads.pre_dir, lewis_roads.street_nam, lewis_roads.street_typ, lewis_roads.suf_dir) AS street,
    lewis_roads.geom
   FROM lewis_roads
  WHERE lewis_roads.pre_type IS NULL
UNION
 SELECT 'Lewis'::text AS county,
    concat(lewis_roads.pre_type, ' ', lewis_roads.street_nam) AS street,
    lewis_roads.geom
   FROM lewis_roads
  WHERE lewis_roads.pre_type IS NOT NULL
UNION
 SELECT 'Kitsap'::text AS county,
    format_road(kitsap_roads.prefix::text::character varying, kitsap_roads.streetname, kitsap_roads.streettype, kitsap_roads.suffix) AS street,
    kitsap_roads.geom
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
 SELECT 'Jefferson'::text AS county,
    format_road(jefferson_roads.st_predir, jefferson_roads.streetname, jefferson_roads.st_postyp, jefferson_roads.st_posdir) AS street,
    jefferson_roads.geom
   FROM jefferson_roads
  WHERE jefferson_roads.st_pretyp IS NULL AND jefferson_roads.status::text = 'Approved'::text
UNION
 SELECT 'Jefferson'::text AS county,
    concat(
        CASE
            WHEN jefferson_roads.st_pretyp::text = 'HWY'::text THEN 'Highway '::text
            WHEN jefferson_roads.st_pretyp::text = 'SR'::text THEN 'State Route '::text
            ELSE NULL::text
        END, jefferson_roads.streetname) AS street,
    jefferson_roads.geom
   FROM jefferson_roads
  WHERE jefferson_roads.st_pretyp IS NOT NULL AND jefferson_roads.status::text = 'Approved'::text
UNION
 SELECT 'Mason'::text AS county,
    format_road(mason_roads.fedirp, mason_roads.fename, mason_roads.fetype, mason_roads.fedirs) AS street,
    mason_roads.geom
   FROM mason_roads
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
 SELECT 'Spokane'::text AS county,
    format_road(spokane_roads.prefixdire, spokane_roads.streetname, spokane_roads.streettype, ''::character varying) AS street,
    spokane_roads.geom
   FROM spokane_roads
  WHERE spokane_roads.prefixtype IS NULL
UNION
 SELECT 'Spokane'::text AS county,
    concat(spokane_roads.prefixtype, ' ', spokane_roads.streetname) AS street,
    spokane_roads.geom
   FROM spokane_roads
  WHERE spokane_roads.prefixtype IS NOT NULL
UNION
 SELECT 'King'::text AS county,
    format_road(king_roads.prefix_l, king_roads.name_l, king_roads.type_l, king_roads.suffix_l) AS street,
    king_roads.geom
   FROM king_roads
  WHERE king_roads.fullname_l::text = king_roads.fullname_r::text AND king_roads.name_l::text <> 'Unnamed'::text
UNION
 SELECT 'King'::text AS county,
    concat('Left = ', format_road(king_roads.prefix_l, king_roads.name_l, king_roads.type_l, king_roads.suffix_l), ' Right = ', format_road(king_roads.prefix_r, king_roads.name_r, king_roads.type_r, king_roads.suffix_r)) AS street,
    king_roads.geom
   FROM king_roads
  WHERE king_roads.fullname_l::text <> king_roads.fullname_r::text
UNION
 SELECT 'King'::text AS county,
    ''::character varying AS street,
    king_roads.geom
   FROM king_roads
  WHERE king_roads.name_l::text = 'Unnamed'::text
UNION
 SELECT 'Lincoln'::text AS county,
    format_road(lincoln_roads.predir, lincoln_roads.streetname, lincoln_roads.streettype, lincoln_roads.postdir) AS street,
    lincoln_roads.geom
   FROM lincoln_roads
UNION
 SELECT 'Pacific'::text AS county,
    pacific_roads.name AS street,
    pacific_roads.geom
   FROM pacific_roads
UNION
 SELECT 'Pend Oreille'::text AS county,
    btrim(concat(pend_oreille_roads.st_predir, ' ', pend_oreille_roads.streetname, ' ', pend_oreille_roads.st_postyp, ' ', pend_oreille_roads.st_posdir), ' '::text) AS street,
    pend_oreille_roads.geom
   FROM pend_oreille_roads
  WHERE pend_oreille_roads.st_pretyp IS NULL AND pend_oreille_roads.lst_type::text <> 'Trail'::text
UNION
 SELECT 'Pend Oreille'::text AS county,
    btrim(concat(pend_oreille_roads.st_predir, ' ', pend_oreille_roads.streetname, ' Trail ', pend_oreille_roads.st_posdir), ' '::text) AS street,
    pend_oreille_roads.geom
   FROM pend_oreille_roads
  WHERE pend_oreille_roads.st_pretyp IS NULL AND pend_oreille_roads.lst_type::text = 'Trail'::text
UNION
 SELECT 'Pend Oreille'::text AS county,
    pend_oreille_roads.lst_name AS street,
    pend_oreille_roads.geom
   FROM pend_oreille_roads
  WHERE pend_oreille_roads.st_pretyp IS NOT NULL
UNION
 SELECT 'Pierce'::text AS county,
    format_road(pierce_roads.predir, pierce_roads.name, pierce_roads.type, pierce_roads.sufdir) AS street,
    pierce_roads.geom
   FROM pierce_roads
UNION
 SELECT 'Thurston'::text AS county,
    format_road(thurston_roads_full.st_predir, thurston_roads_full.streetname, thurston_roads_full.st_postyp, thurston_roads_full.st_posdir) AS street,
    thurston_roads_full.geom
   FROM thurston_roads_full
UNION
 SELECT 'Okanogan'::text AS county,
    format_road(okanogan_roads.direction, okanogan_roads.name, okanogan_roads.type, okanogan_roads.sufdir) AS street,
    okanogan_roads.geom
   FROM okanogan_roads
UNION
 SELECT 'Yakama'::text AS county,
    format_road(yakama_roads.pre_dir, yakama_roads.street_nam, yakama_roads.street_typ, yakama_roads.suf_dir) AS street,
    yakama_roads.geom
   FROM yakama_roads;

ALTER TABLE public.wa_county_roads
  OWNER TO clifford;
