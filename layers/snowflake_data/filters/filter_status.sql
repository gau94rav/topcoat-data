
 
select INITCAP(is_currently_present) as is_currently_present

from "DATA_PRODUCTS"."PROD_MARTS"."DIM_CURRENTLY_PRESENT"


{{ column(
 name='IS_CURRENTLY_PRESENT',
 tags=['ids','names']
)}} 
