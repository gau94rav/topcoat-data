select 
last_introduced, sum(open_vuln) as open_vuln
from
(select last_introduced, open_vuln from {{ref('open_issues')}}
    union all 
select last_introduced, open_vuln from {{ref('date_spine') }}
   )
group by 1