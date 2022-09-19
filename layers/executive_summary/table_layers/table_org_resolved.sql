select 
org_display_name,
  count( case when 
    (to_date(last_disappeared) <= '{{ filter('exec_summary_end') }}'
  and to_date(last_disappeared) >= '{{ filter('exec_summary_start') }}')
  then grouped_by_key else null end) as resolved_c,
count( case when 
    (to_date(last_disappeared) 
    <= DATEADD(DAY, (DATEDIFF(day,'{{ filter('exec_summary_end') }}','{{ filter('exec_summary_start') }}'))-1, '{{ filter('exec_summary_end') }}')
    and to_date(last_disappeared) 
    >= DATEADD(DAY, (DATEDIFF(day,'{{ filter('exec_summary_end') }}','{{ filter('exec_summary_start') }}'))-1, '{{ filter('exec_summary_start') }}'))
  then grouped_by_key else null end) as resolved_p

from {{ref('seed_executive_summary')}}
  where 1=1

group by 1