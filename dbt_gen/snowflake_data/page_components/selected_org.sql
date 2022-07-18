 
SELECT distinct org_public_id, org_display_name
from {{ ref('seed_filtered_ungrouped_issues') }}
Where  (group_public_id IN ('group_id') OR org_public_id IN ('org_id')) 


 

 