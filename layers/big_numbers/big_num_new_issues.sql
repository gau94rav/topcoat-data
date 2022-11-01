
select

count(case when 
    (date_trunc('DAY',LAST_INTRODUCED) <= '{{ filter('issue_summary_end') }}'
  and date_trunc('DAY',LAST_INTRODUCED) >= '{{ filter('issue_summary_start') }}') 
  then grouped_by_key else null end) as new_vuln_c,

count(case when 
    (date_trunc('DAY',LAST_INTRODUCED) <= DATEADD(DAY, (DATEDIFF(day,'{{ filter('issue_summary_end') }}','{{ filter('issue_summary_start') }}'))-1, '{{ filter('issue_summary_end') }}')
and date_trunc('DAY',LAST_INTRODUCED)  >= DATEADD(DAY, (DATEDIFF(day,'{{ filter('issue_summary_end') }}','{{ filter('issue_summary_start') }}'))-1, '{{ filter('issue_summary_start') }}'))
  then grouped_by_key else null end) as new_vuln_p

from {{ref('base_issues_summary')}}
where 1=1




