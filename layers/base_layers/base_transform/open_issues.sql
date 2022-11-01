
  select
   to_date(last_introduced) as last_introduced,
  count(grouped_by_key) as open_vuln
   from {{ref('base_issues_summary')}} i
   where 1=1
   group by 1
