## Need to fix names with a de such as Van de Vars and Colonel de Vars
create or replace function prop_name(fullname varchar) RETURNS varchar AS $$
DECLARE
  r varchar;
BEGIN
	SELECT into r
		CASE fullname
			WHEN 'MCA%' THEN 
				REPLACE(INITCAP(fullname),'Mca',McA')
			WHEN 'MCB%' THEN 
				REPLACE(INITCAP(fullname),'Mcb',McB')
			WHEN 'MCC%' THEN 
				REPLACE(INITCAP(fullname),'Mcc',McC')
			WHEN 'MCD%' THEN 
				REPLACE(INITCAP(fullname),'Mcd',McD')
			WHEN 'MCE%' THEN 
				REPLACE(INITCAP(fullname),'Mce',McE')
			WHEN 'MCF%' THEN 
				REPLACE(INITCAP(fullname),'Mcf',McF')
			WHEN 'MCG%' THEN 
				REPLACE(INITCAP(fullname),'Mcg',McG')
			WHEN 'COLONEL DE VARS' THEN 'Colonel de Vars'
		ELSE
			initcap(fullname)
	END;
	RETURN r;
END;
$$ LANGUAGE plpgsql;
