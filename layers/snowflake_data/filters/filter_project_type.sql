
 
select project_type

from "DATA_PRODUCTS"."PROD_MARTS"."DIM_PROJECT_TYPE"
order by 1

{{ column(
 name='PROJECT_TYPE',
 tags=['ids','names']
)}} 
