SELECT 
count(*) as value
from {{ref('seed_filtered_ungrouped_issues')}} i

where 1=1
and issue_severity = 'high'
and issue_type = 'License'