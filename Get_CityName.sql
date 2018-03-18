CREATE OR REPLACE FUNCTION Get_CityName(in_geom geometry) RETURNS VARCHAR AS $$
DECLARE                                                                                                                                                             +
    place_name VARCHAR;                                                                                                                                         +
 BEGIN                                                                                                                                                               +
    SELECT display_name  INTO place_name FROM geonames ORDER BY geom <-> ST_Centroid(in_geom) LIMIT 1;
    RETURN place_name;                                                                                                                                          +
END;                                                                                                                                                                +
$$ LANGUAGE plpgsql;
