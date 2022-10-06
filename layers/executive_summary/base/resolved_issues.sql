  select
   to_date(last_disappeared) as last_disappeared,
  count(grouped_by_key) as resolved_vuln
   from {{ref('seed_executive_summary')}} i
   where 1=1
   and last_disappeared is not null
and last_disappeared > last_introduced
   group by 1
