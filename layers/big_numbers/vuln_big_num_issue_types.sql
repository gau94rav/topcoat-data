SELECT 
count(distinct case when issue_type = 'Vulnerability' then problem_id else null end) as vulnerability,
count(distinct case when issue_type = 'License' then problem_id else null end) as license,
count(distinct case when issue_type = 'Configuration' then problem_id else null end) as configuration
from {{ref('base_issues_detail')}} i
where 1=1
