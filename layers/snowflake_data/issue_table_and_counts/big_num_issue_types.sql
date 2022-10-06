SELECT 
count(case when issue_type = 'Vulnerability' then 1 else null end) as vulnerability,
count(case when issue_type = 'License' then 1 else null end) as license,
count(case when issue_type = 'Configuration' then 1 else null end) as configuration
from {{ref('seed_filtered_ungrouped_issues')}} i
where 1=1
