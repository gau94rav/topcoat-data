SELECT
org_public_id,

round(avg(case when
    (to_date(last_disappeared) <= '{{ filter('issue_summary_end') }}'
  and to_date(last_disappeared) >= '{{ filter('issue_summary_start') }}') 
  then days_to_disappear else null end),2) as mtr_c,
  
  round(avg(case when 
    (to_date(last_disappeared)
    <= DATEADD(DAY, (DATEDIFF(day,'{{ filter('issue_summary_end') }}','{{ filter('issue_summary_start') }}'))-1, '{{ filter('issue_summary_end') }}')
and to_date(last_disappeared) >= DATEADD(DAY, (DATEDIFF(day,'{{ filter('issue_summary_end') }}','{{ filter('issue_summary_start') }}'))-1, '{{ filter('issue_summary_start') }}'))
  then days_to_disappear  else null end),2) as mtr_p

  from {{ref('issues_cross_join')}}
  where 1=1

group by 1
