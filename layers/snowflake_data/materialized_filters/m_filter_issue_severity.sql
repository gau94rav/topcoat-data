
 
SELECT issue_severity as issue_severity
from "SANDBOX"."TC_TEST"."ISSUE_SEVERITY"

 
{{ column(
 name='ISSUE_SEVERITY',
 tags=['ids','names']
)}} 