SELECT 
count(*) as VALUE
from {{ ref('base_issues_detail') }} i
where 1=1
and product_name = 'Snyk Code'