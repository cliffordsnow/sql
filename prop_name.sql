## Need to fix names with a de such as Van de Vars and Colonel de Vars
create or replace function prop_name(fullname varchar) RETURNS varchar AS $$
DECLARE
  r varchar;
BEGIN
	SELECT into r
		CASE fullname
			WHEN 'MCBANE' THEN 'McBane'
			WHEN 'MCCLELLAN' THEN 'McClellan'
			WHEN 'MCCLINTOCK' THEN 'McClintock'
			WHEN 'MCCORD' THEN 'McCord'
			WHEN 'MCCORMICK' THEN 'McCormick'
			WHEN 'MCCOY' THEN 'McCoy'
			WHEN 'MCCULLOUGH' THEN 'McCullough'
			WHEN 'MCDOUGALL' THEN 'McDougall'
			WHEN 'MCGILVRA' THEN 'McGilvra'
			WHEN 'MCGRAW' THEN 'McGraw'
			WHEN 'MCHUGH' THEN 'McHugh'
			WHEN 'MCINTOSH' THEN 'McIntosh'
			WHEN 'MCINTYRE' THEN 'McIntyre'
			WHEN 'MCKAY' THEN 'McKay'
			WHEN 'MCKEAN' THEN 'McKean'
			WHEN 'MCKINLEY' THEN 'McKinley'
			WHEN 'MCLEAN' THEN 'McLean'
			WHEN 'VAN DE VARS' THEN 'Van de Vars'
			WHEN 'COLONEL DE VARS' THEN 'Colonel de Vars'
		ELSE
			initcap(fullname)
	END;
	RETURN r;
END;
$$ LANGUAGE plpgsql;
