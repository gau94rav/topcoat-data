SELECT distinct group_public_id, group_name
from {{ ref('base_issues_detail') }}
Where  (group_public_id IN ('group_id') OR org_public_id IN ('org_id')) 



 

 