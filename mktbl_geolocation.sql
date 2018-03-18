CREATE TABLE public.geolocation
(
  gid bigint NOT NULL,
  name character varying(200),
  asciiname character varying(200),
  alt_name character varying(1000),
  fclass character(1),
  fcode	character(2),
  latitude double precision,
  longitude double precision,
  country_code character(2),
  cc2 character(200),
  admin1_code character varying(20),
  admin2_code character varying(80),
  admin3_code character varying(20),
  admin4_code character varying(20),
  population bigint,
  elevation integer,
  dem integer,
  timezone character varying(40),
  modification_date date,
  geom geometry(POINT,4326),
  CONSTRAINT geolocation_pkey PRIMARY KEY (gid)
)