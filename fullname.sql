create or replace function fullname (pd varchar, name varchar, type varchar, sd varchar) RETURNS varchar AS $$
DECLARE 
  fullname varchar;
BEGIN
	IF name IS NULL THEN 
		RETURN '';
	END IF;
	
	if pd IS NOT NULL THEN
		fullname := pd || ' ';
	ELSE
		fullname := '';
	END IF;
	fullname := fullname || name || ' ';
	fullname := fullname || type;
	IF sd IS NOT NULL THEN
		fullname := fullname || ' ' || sd;
	END IF;
	return trim(leading ' ' from fullname);
	
	
END;
$$ LANGUAGE plpgsql;
