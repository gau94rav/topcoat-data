SELECT 

count(distinct problem_id) as VALUE
from {{ref('seed_filtered_ungrouped_issues')}} i
where 1=1

{{column(
    name='VALUE',
    tags=['value']
)}}