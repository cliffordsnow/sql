create or replace function expand_direction (n varchar) RETURNS varchar AS $$
DECLARE 
  dir varchar;
BEGIN
	IF n IS NULL THEN 
		RETURN '';
	END IF;
	SELECT INTO dir
		CASE n
			WHEN 'N' THEN 'North'
			WHEN 'NE' THEN 'Northeast'
			WHEN 'NW' THEN 'Northwest'
			WHEN 'E' THEN 'East'
			WHEN 'W' THEN 'West'
			WHEN 'S' THEN 'South'
			WHEN 'SE' THEN 'Southeast'
			WHEN 'SW'THEN 'Southwest'
	END;
	RETURN dir;
END;
$$ LANGUAGE plpgsql;
