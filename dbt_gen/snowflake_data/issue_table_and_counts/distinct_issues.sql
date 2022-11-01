SELECT 

count(distinct problem_id) as VALUE
from {{ ref('base_issues_detail') }} i
where 1=1