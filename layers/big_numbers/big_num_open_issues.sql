select 
all_c-resolved_c as open_c, 
all_p-resolved_p as open_p
from
(select 
    count(
    case when to_date(last_introduced) <= '{{ filter('issue_summary_end') }}'
    then grouped_by_key else null end) as all_c,
    count(
    case when to_date(last_introduced) <= DATEADD(DAY, DATEDIFF(day,'{{ filter('issue_summary_end') }}','{{ filter('issue_summary_start') }}')-1, '{{ filter('issue_summary_end') }}')/*end date*/
    then grouped_by_key else null end) as all_p,
  count( case when 
    to_date(last_disappeared) <= '{{ filter('issue_summary_end') }}' 
    and issue_state !='Open'
  then grouped_by_key else null end) as resolved_c,
count( case when 
    to_date(last_disappeared) 
    <= DATEADD(DAY, (DATEDIFF(day,'{{ filter('issue_summary_end') }}','{{ filter('issue_summary_start') }}'))-1, '{{ filter('issue_summary_end') }}')
    and issue_state !='Open'
  then grouped_by_key else null end) as resolved_p
    
    from {{ref('base_issues_summary')}}
    
  )






