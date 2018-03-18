CREATE FUNCTION patindex("pattern" VARCHAR, "expression" VARCHAR ) RETURNS INT AS $BODY$
SELECT
    COALESCE(
        STRPOS(
             $2
            ,(
                SELECT
                    ( REGEXP_MATCHES(
                        $2
                        ,'(' || REPLACE( REPLACE( TRIM( $1, '%' ), '%', '.*?' ), '_', '.' ) || ')'
                    ) )[ 1 ]
                LIMIT 1
            )
        )
        ,0
    )
;
$BODY$ LANGUAGE 'sql' IMMUTABLE;


CREATE FUNCTION ProperCase (name VARCHAR) RETURNS VARCHAR AS 
$$
DECLARE 
TempString VARCHAR;
PS VARCHAR;
SETPS = ''
-- lower case entire string
SET TempString = lower(@String)
WHILE patindex('%[-( '']%',TempString) > 0 BEGIN
  -- Check to see if first character of TempString is whitespace
  IF (patindex('%[-( '']%',SUBSTRINGTempString,1,1)) > 0)
  THEN
      SETPS =PS + SUBSTRINGTempString,1,1)
  ELSE -- TempString starts with a Name
      IF SUBSTRING(TempString,1,2) = 'mc'
   		THEN
     		SET PS = PS + 'Mc'
     		SET TempString = SUBSTRING(@Tempstring,3,LEN(TempString))
   	  END
   IF SUBSTRING(TempString,1,3) = 'mac'
   THEN
     SET PS = PS + 'Mac'
     SET TempString = SUBSTRING(@Tempstring,4,LEN(TempString))
   END
      
    -- upper case first character and return string up to the next space
    SET PS = PS + UPPER(SUBSTRING(TempString,1,1)) +
     SUBSTRING(TempString,2,patindex('%[-( '']%',TempString)-1)
    
    
  END LOOP
  -- truncation string that we have already processed
  
  SET TempString = SUBSTRING(TempString,
     patindex('%[-( '']%',TempString)+1,LEN(TempString))
  -- Trim off leading spaces
  SET TempString = LTRIM(TempString)
END
IF SUBSTRING(TempString,1,2) = 'mc'
THEN
  SET PS = PS + 'Mc'
  SET TempString = SUBSTRING(@Tempstring,3,LEN(TempString))
END
IF SUBSTRING(TempString,1,3) = 'mac'
THEN
  SET PS = PS + 'Mac'
  SET TempString = SUBSTRING(@Tempstring,4,LEN(TempString))
END
-- proper case last word/name
SET PS = PS + UPPER(SUBSTRING(TempString,1,1)) +
SUBSTRING(TempString,2,LEN(TempString))
-- check for spaces in front of special characters
SET PS = Replace(PS,' -','-')
SET PS = Replace(PS,' ''','''')

RETURN (PS)
END
