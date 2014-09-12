## Need to fix names with a de such as Van de Vars and Colonel de Vars
create or replace function prop_name(fullname varchar) RETURNS varchar AS $$
DECLARE
  r varchar;
BEGIN
	SELECT into r
		CASE fullname
			WHEN 'MCA%' THEN 
				REPLACE(INITCAP(fullname),'Mca','McA')
			WHEN 'MCB%' THEN 
				REPLACE(INITCAP(fullname),'Mcb','McB')
			WHEN 'MCC%' THEN 
				REPLACE(INITCAP(fullname),'Mcc','McC')
			WHEN 'MCD%' THEN 
				REPLACE(INITCAP(fullname),'Mcd','McD')
			WHEN 'MCE%' THEN 
				REPLACE(INITCAP(fullname),'Mce','McE')
			WHEN 'MCF%' THEN 
				REPLACE(INITCAP(fullname),'Mcf','McF')
			WHEN 'MCG%' THEN 
				REPLACE(INITCAP(fullname),'Mcg','McG')
			WHEN 'MCH%' THEN 
				REPLACE(INITCAP(fullname),'Mch','McH')
			WHEN 'MCI%' THEN 
				REPLACE(INITCAP(fullname),'Mci','McI')
			WHEN 'MCJ%' THEN 
				REPLACE(INITCAP(fullname),'Mcj','McJ')
			WHEN 'MCK%' THEN 
				REPLACE(INITCAP(fullname),'Mck','McK')
			WHEN 'MCL%' THEN 
				REPLACE(INITCAP(fullname),'Mcl','McL')
			WHEN 'MCM%' THEN 
				REPLACE(INITCAP(fullname),'Mcm','McM')
			WHEN 'MCN%' THEN 
				REPLACE(INITCAP(fullname),'Mcn','McN')
			WHEN 'MCO%' THEN 
				REPLACE(INITCAP(fullname),'Mco','McO')
			WHEN 'MCP%' THEN 
				REPLACE(INITCAP(fullname),'Mcp','McP')
			WHEN 'MCQ%' THEN 
				REPLACE(INITCAP(fullname),'Mcq','McQ')
			WHEN 'MCR%' THEN 
				REPLACE(INITCAP(fullname),'Mcr','McR')
			WHEN 'MCS%' THEN 
				REPLACE(INITCAP(fullname),'Mcs','McS')
			WHEN 'MCT%' THEN 
				REPLACE(INITCAP(fullname),'Mct','McT')
			WHEN 'MCU%' THEN 
				REPLACE(INITCAP(fullname),'Mcu','McU')
			WHEN 'MCV%' THEN 
				REPLACE(INITCAP(fullname),'Mcv','McV')
			WHEN 'MCW%' THEN 
				REPLACE(INITCAP(fullname),'Mcw','McW')
			WHEN 'MCX%' THEN 
				REPLACE(INITCAP(fullname),'Mcx','McX')
			WHEN 'MCY%' THEN 
				REPLACE(INITCAP(fullname),'Mcy','McY')
			WHEN 'MCZ%' THEN 
				REPLACE(INITCAP(fullname),'Mcz','McZ')
			WHEN '% DE %' THEN 
				REPLACE(INITCAP(fullname),' De ',' de ')
		ELSE
			initcap(fullname)
	END;
	RETURN r;
END;
$$ LANGUAGE plpgsql;
