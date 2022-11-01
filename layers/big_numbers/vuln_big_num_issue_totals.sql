SELECT 
 COUNT(*) AS total,
 COUNT(distinct problem_id) AS total_unique
from {{ref('base_issues_detail')}} i
where 1=1

