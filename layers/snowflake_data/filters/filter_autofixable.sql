
 
 
select INITCAP(is_currently_ignored) as autofixable

from "REPORTING"."MIGRATED_MARTS"."DIM_CURRENTLY_IGNORED"


{{ column(
 name='AUTOFIXABLE',
 tags=['ids','names']
)}} 
