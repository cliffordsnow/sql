CREATE OR REPLACE FUNCTION pyparse2full_street(street text)
	returns varchar as
$$
	import usaddress

	print street
	s = usaddress.tag(street)
	return s[0]

$$ LANGUAGE plpythonu;
