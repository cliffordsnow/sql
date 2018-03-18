CREATE OR REPLACE FUNCTION pyparse2full_street(street text)
	returns text[] as
$$
	import usaddress
	from array import array

	if not street:
		return
		
	s = usaddress.tag(street)

	if s[0].has_key('StreetNamePreDirectional'):
		s1 = s[0]['StreetNamePreDirectional']
	else:
		s1 = ''

	if s[0].has_key('StreetName'):
		s2 = s[0]['StreetName']
	else:
		s2 = ''

	if s[0].has_key('StreetNamePostType'):
		s3 = s[0]['StreetNamePostType']
	else:
		s3 = ''

	if s[0].has_key('StreetNamePostDirectional'):
		s4 = s[0]['StreetNamePostDirectional']
	else:	
		s4 = ''

	return [s1, s2, s3, s4];


$$ LANGUAGE plpythonu;
