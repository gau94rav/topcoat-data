
 
select INITCAP(is_currently_ignored) as is_currently_ignored

from "REPORTING"."MIGRATED_MARTS"."DIM_CURRENTLY_IGNORED"


{{ column(
 name='IS_CURRENTLY_IGNORED',
 tags=['ids','names']
)}} 