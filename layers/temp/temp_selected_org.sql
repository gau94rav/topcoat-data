SELECT distinct org_name
from {{ref('seed_filtered_ungrouped_issues')}}
Where {{ authorized_orgs('org_public_id', 'group_public_id') }}