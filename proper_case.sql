CREATE OR REPLACE FUNCTION proper_case(name varchar) RETURNS VARCHAR AS $BODY$
DECLARE
	r VARCHAR;
	c CHAR;
	s VARCHAR;
	s2 VARCHAR;

BEGIN
	r = INITCAP(TRIM(leading ' ' FROM name));
	IF SUBSTRING(r FROM 1 FOR 2) = 'Mc' THEN
		c = substring(r from 3 for 1);
		s = '^Mc' || c;
		s2 = 'Mc' || upper(c);
		r = regexp_replace(r,s,s2);
	ELSEIF SUBSTRING(r FROM 1 FOR 3) = 'Mac' THEN
		c = SUBSTRING(r FROM 4 FOR 1);
		s = '^Mac' || c;
		s2 = 'Mac' || UPPER(c);	
		r = REGEXP_REPLACE(r,s,s2);
	ELSEIF SUBSTRING(r FROM 1 FOR 3) = 'Fs ' THEN
		r = REGEXP_REPLACE(r,'^Fs ','FS ');
	end if;
	
	
	r = REGEXP_REPLACE(r,' De ',' de ');


	RETURN r;
END;
$BODY$
LANGUAGE PLPGSQL 
