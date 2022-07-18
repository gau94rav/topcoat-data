SELECT 
count(*) as value,
sum(case when (is_upgradeable) = true OR (is_patchable = true) OR (is_pinnable = true) then 1 else 0 end) AS comparison
from {{ref('seed_filtered_ungrouped_issues')}} i

where 1=1
and issue_severity = 'Low'
and issue_type != 'License'

{{column(
    name='VALUE',
    tags=['value']
)}}