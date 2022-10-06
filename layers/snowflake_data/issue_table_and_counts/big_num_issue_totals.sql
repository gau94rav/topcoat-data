SELECT 
 COUNT(*) AS total,
 COUNT(distinct problem_id) AS total_unique
from {{ref('seed_filtered_ungrouped_issues')}} i
where 1=1

