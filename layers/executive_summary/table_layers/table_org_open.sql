select
        org_display_name,
        count(     case 
            when to_date(last_introduced) <= '{{ filter('exec_summary_end') }}'     then grouped_by_key 
            else null 
        end) as all_c,
        count(     case 
            when to_date(last_introduced) <= DATEADD(DAY,
            DATEDIFF(day,
            '{{ filter('exec_summary_end') }}',
            '{{ filter('exec_summary_start') }}')-1,
            '{{ filter('exec_summary_end') }}')
            then grouped_by_key 
        else null 
    end) as all_p,
    count( case 
        when      to_date(last_disappeared) <= '{{ filter('exec_summary_end') }}'   then grouped_by_key 
        else null 
    end) as resolved_c,
    count( case 
        when      to_date(last_disappeared)      <= DATEADD(DAY,
        (DATEDIFF(day,
        '{{ filter('exec_summary_end') }}',
        '{{ filter('exec_summary_start') }}'))-1,
        '{{ filter('exec_summary_end') }}')        then grouped_by_key 
        else null 
    end) as resolved_p          
from
    {{ref('seed_executive_summary')}}          
group by
    1
  
 