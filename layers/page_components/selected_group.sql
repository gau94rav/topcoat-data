SELECT distinct group_public_id, group_name
from {{ref('base_issues_detail')}}
Where {{ authorized_orgs('org_public_id', 'group_public_id') }}



{{ column(
 name='GROUP_NAME',
 tags=['labels']
)}} 

{{ column(
 name='GROUP_PUBLIC_ID',
 tags=['options']
)}} 