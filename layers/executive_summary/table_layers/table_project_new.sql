select
project_name,
project_id,
count(case when 
    (date_trunc('DAY',last_INTRODUCED) <= '{{ filter('exec_summary_end') }}'
  and date_trunc('DAY',last_INTRODUCED) >= '{{ filter('exec_summary_start') }}') 
  then grouped_by_key else null end) as new_c,

count(case when 
    (date_trunc('DAY',last_INTRODUCED) <= DATEADD(DAY, (DATEDIFF(day,'{{ filter('exec_summary_end') }}','{{ filter('exec_summary_start') }}'))-1, '{{ filter('exec_summary_end') }}')
and date_trunc('DAY',last_INTRODUCED)  >= DATEADD(DAY, (DATEDIFF(day,'{{ filter('exec_summary_end') }}','{{ filter('exec_summary_start') }}'))-1, '{{ filter('exec_summary_start') }}'))
  then grouped_by_key else null end) as new_p



from {{ref('seed_executive_summary')}}
where 1=1

group by 1,2