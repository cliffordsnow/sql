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
			WHEN 'KP N' Then 'Key Peninsula North'
			WHEN 'NE' THEN 'Northeast'
			WHEN 'KP NE' Then 'Key Peninsula Northeast'
			WHEN 'NW' THEN 'Northwest'
			WHEN 'KP NW' Then 'Key Peninsula Northwest'
			WHEN 'E' THEN 'East'
			WHEN 'KP E' Then 'Key Peninsula East'
			WHEN 'W' THEN 'West'
			WHEN 'KP W' Then 'Key Peninsula West'
			WHEN 'S' THEN 'South'
			WHEN 'KP S' Then 'Key Peninsula South'
			WHEN 'SE' THEN 'Southeast'
			WHEN 'KP SE' Then 'Key Peninsula Southeast'
			WHEN 'SW'THEN 'Southwest'
			WHEN 'KP Sw' Then 'Key Peninsula Southwest'
			ELSE n
	END;
	RETURN dir;
END;
$$ LANGUAGE plpgsql;
