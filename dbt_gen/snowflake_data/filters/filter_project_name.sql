select project_id, project_name
from "REPORTING"."MIGRATED_MARTS"."DIM_PROJECT_NAME"
where  (group_public_id IN ('group_id') OR org_public_id IN ('org_id')) 

and org_public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'


order by 2



 

 