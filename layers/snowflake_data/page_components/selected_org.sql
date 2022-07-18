
 
SELECT distinct org_public_id, org_display_name
from {{ref('seed_filtered_ungrouped_issues')}}
Where {{ authorized_orgs('org_public_id', 'group_public_id') }}


{{ column(
 name='ORG_DISPLAY_NAME',
 tags=['labels']
)}} 

{{ column(
 name='ORG_PUBLIC_ID',
 tags=['options']
)}} 

