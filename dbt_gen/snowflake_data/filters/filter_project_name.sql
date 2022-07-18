select distinct project_id, project_name
from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V3"
where  (group_public_id IN ('group_id') OR org_public_id IN ('org_id')) 

and org_public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'


order by 2



 

 