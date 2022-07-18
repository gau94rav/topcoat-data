SELECT 
count(*) as VALUE
from {{ ref('seed_filtered_ungrouped_issues') }} i
where 1=1
and issue_type = 'Vulnerability'