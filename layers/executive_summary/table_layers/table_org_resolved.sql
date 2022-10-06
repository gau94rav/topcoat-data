select 
org_public_id,
  count( case when 
    (to_date(last_disappeared) <= '{{ filter('issue_summary_end') }}'
  and to_date(last_disappeared) >= '{{ filter('issue_summary_start') }}')
  then grouped_by_key else null end) as resolved_c,
count( case when 
    (to_date(last_disappeared) 
    <= DATEADD(DAY, (DATEDIFF(day,'{{ filter('issue_summary_end') }}','{{ filter('issue_summary_start') }}'))-1, '{{ filter('issue_summary_end') }}')
    and to_date(last_disappeared) 
    >= DATEADD(DAY, (DATEDIFF(day,'{{ filter('issue_summary_end') }}','{{ filter('issue_summary_start') }}'))-1, '{{ filter('issue_summary_start') }}'))
  then grouped_by_key else null end) as resolved_p

from {{ref('seed_executive_summary')}}
  where 1=1

group by 1