
 
SELECT issue_severity
from "DATA_PRODUCTS"."PROD_MARTS"."DIM_ISSUE_SEVERITY"
order by sort_column
 
{{ column(
 name='ISSUE_SEVERITY',
 tags=['ids','names']
)}} 