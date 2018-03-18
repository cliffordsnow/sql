 -- patindex recreates mysql function by the same name
CREATE or REPLACE FUNCTION patindex("pattern" VARCHAR, "expression" VARCHAR ) RETURNS INT AS $BODY$
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