SELECT 
count(*) as VALUE
from {{ ref('base_issues_detail') }} i
where 1=1
and is_currently_present = true