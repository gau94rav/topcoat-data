
 
select INITCAP(bool_value) as autofixable

from "REPORTING"."MIGRATED_MARTS"."DIMS_BOOL"


{{ column(
 name='AUTOFIXABLE',
 tags=['ids','names']
)}} 
