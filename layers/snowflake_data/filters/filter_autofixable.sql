
 
 
select INITCAP(is_currently_ignored) as autofixable

from "DATA_PRODUCTS"."PROD_MARTS"."DIM_CURRENTLY_IGNORED"


{{ column(
 name='AUTOFIXABLE',
 tags=['ids','names']
)}} 
