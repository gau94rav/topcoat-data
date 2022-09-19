select 
    ou.last_introduced,
    sum(open_vuln) over (order by last_introduced asc rows between unbounded preceding and current row) as open_vuln,
    sum(resolved_vuln) over (order by last_introduced asc rows between unbounded preceding and current row) as resolved_vuln
    
from {{ref('open_union')}} ou
left join {{ref('resolved_union')}} ru 
on ou.last_introduced = ru.last_disappeared
order by 1 desc