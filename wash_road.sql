create or replace function wa_road(pt varchar, fullname varchar, pd varchar,name varchar,typ varchar,sd varchar) RETURNS varchar AS $$
DECLARE
  full_name varchar;
BEGIN
	IF pt IS NOT NULL THEN
		full_name := initcap(fullname) || '' || pt;
	ELSE
		full_name := expand_direction(pd) || ' ';
		full_name := full_name ||  initcap(name);
		full_name := full_name || ' ' || expand_road(typ);
		IF sd IS NOT NULL THEN
			full_name := full_name || ' ' || expand_direction(sd);
		END IF;
	END IF;
	RETURN trim(leading ' ' from full_name);
END;
$$ LANGUAGE plpgsql;
