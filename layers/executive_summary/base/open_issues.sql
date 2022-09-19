
  select
   to_date(last_introduced) as last_introduced,
  count(grouped_by_key) as open_vuln
   from {{ref('seed_executive_summary')}} i
   where 1=1
   group by 1
  order by 1