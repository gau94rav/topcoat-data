
 
SELECT distinct group_public_id, group_name
from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}


{{ column(
 name='GROUP_NAME',
 tags=['labels']
)}} 

{{ column(
 name='GROUP_PUBLIC_ID',
 tags=['options']
)}} 