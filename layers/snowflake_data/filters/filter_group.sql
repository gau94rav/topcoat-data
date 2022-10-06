
 
SELECT distinct group_public_id, group_name
from "REPORTING"."MIGRATED_MARTS"."ISSUES"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}


{{ column(
 name='GROUP_NAME',
 tags=['labels']
)}} 

{{ column(
 name='GROUP_PUBLIC_ID',
 tags=['options']
)}} 