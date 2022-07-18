
 
SELECT distinct issue_severity
from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4"

 
{{ column(
 name='ISSUE_SEVERITY',
 tags=['ids','names']
)}} 