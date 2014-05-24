create or replace function kc_rd_class(n varchar) RETURNS varchar as $$
DECLARE
  r varchar;
BEGIN
	IF n IS NULL THEN
		RETURN '';
	END IF;
    SELECT INTO r
	CASE n
		WHEN 'C' THEN 'Collector Arterial'
		WHEN 'F' THEN 'Freeway'
		WHEN 'L' THEN 'Local Arterial'
		WHEN 'M' THEN 'Minor Arterial'
		WHEN 'P' THEN 'Principal Arterial'
		
		END;
	RETURN r;
END;
$$ LANGUAGE plpgsql;
