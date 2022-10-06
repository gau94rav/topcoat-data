 
SELECT distinct org_public_id, org_display_name
from "REPORTING"."MIGRATED_MARTS"."ISSUES"
where  (group_public_id IN ('group_id') OR org_public_id IN ('org_id')) 


 

 