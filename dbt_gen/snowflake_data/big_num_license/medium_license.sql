SELECT 
count(*) as value
from {{ ref('base_issues_detail') }} i
where 1=1
and issue_severity = 'medium'
and issue_type = 'License'