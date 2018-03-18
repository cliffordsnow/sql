-- Need to fix names with a de such as Van de Vars and Colonel de Vars
create or replace function prop_name(fullname varchar) RETURNS varchar AS $$
DECLARE
  r varchar;
BEGIN
	fullname := initcap(fullname);
	CASE 
		WHEN fullname like 'FS %' THEN
			r = REGEXP_REPLACE(fullname,'^Fs ','FS ');
		WHEN fullname like 'MCA%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mca','McA');
		WHEN fullname like 'MCB%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcb','McB');
		WHEN fullname like 'MCC%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcc','McC');
		WHEN fullname like 'MCD%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcd','McD');
		WHEN fullname like 'MCE%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mce','McE');
		WHEN fullname like 'MCF%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcf','McF');
		WHEN fullname like 'MCG%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcg','McG');
		WHEN fullname like 'MCH%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mch','McH');
		WHEN fullname like 'MCI%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mci','McI');
		WHEN fullname like 'MCJ%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcj','McJ');
		WHEN fullname like 'MCK%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mck','McK');
		WHEN fullname like 'MCL%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcl','McL');
		WHEN fullname like 'MCM%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcm','McM');
		WHEN fullname like 'MCN%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcn','McN');
		WHEN fullname like 'MCO%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mco','McO');
		WHEN fullname like 'MCP%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcp','McP');
		WHEN fullname like 'MCQ%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcq','McQ');
		WHEN fullname like 'MCR%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcr','McR');
		WHEN fullname like 'MCS%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcs','McS');
		WHEN fullname like 'MCT%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mct','McT');
		WHEN fullname like 'MCU%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcu','McU');
		WHEN fullname like 'MCV%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcv','McV');
		WHEN fullname like 'MCW%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcw','McW');
		WHEN fullname like 'MCX%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcx','McX');
		WHEN fullname like 'MCY%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcy','McY');
		WHEN fullname like 'MCZ%' THEN 
			r = REGEXP_REPLACE(fullname,'^Mcz','McZ');
		WHEN fullname like '% DE %' THEN 
			r = REGEXP_REPLACE(fullname,'^ De ',' de ');
		ELSE
			r = initcap(fullname);
	END CASE;
	RETURN r;
END;
$$ LANGUAGE plpgsql;
