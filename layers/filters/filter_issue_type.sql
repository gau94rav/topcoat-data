
 

SELECT issue_type
from "REPORTING"."MIGRATED_MARTS"."DIM_ISSUE_TYPE"


 
{{ column(
 name='ISSUE_TYPE',
 tags=['ids','names']
)}} 