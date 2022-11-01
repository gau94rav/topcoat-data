 
select INITCAP(bool_value) as is_currently_ignored

from "REPORTING"."MIGRATED_MARTS"."DIMS_BOOL"


{{ column(
 name='IS_CURRENTLY_IGNORED',
 tags=['ids','names']
)}} 