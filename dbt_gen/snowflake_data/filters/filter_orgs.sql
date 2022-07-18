 
SELECT distinct org_public_id, org_display_name
from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4"
where  (group_public_id IN ('group_id') OR org_public_id IN ('org_id')) 


 

 