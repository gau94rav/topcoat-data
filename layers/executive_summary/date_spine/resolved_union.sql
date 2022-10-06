
select last_disappeared, sum(resolved_vuln) as resolved_vuln
from (
select last_disappeared, resolved_vuln from {{ref('resolved_issues')}}
    union all 
select last_disappeared, resolved_vuln from {{ref('date_spine') }}
)
group by 1