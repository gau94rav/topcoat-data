--big numbers -- all based on the time period selected
    -- open
    -- new
    -- resolved
    -- mean time to resolve
-- line chart
    -- identified and resolved over time (difference between lines = open)
-- two line charts
    -- exposure window over time ()
    -- meantime to resolve over time
-- table
    -- org, open, new, resolved, mean time to resolve
    -- project, open, new, resolved, mean time to resolve
    -- next to each is previous period metric
/*
    select
--date_trunc('DAY',FIRST_INTRODUCED) as first,
--date_trunc('DAY',LAST_INTRODUCED) as last,
date_trunc('DAY',to_date(last_disappeared)) as disappeared,
count(concat(problem_id,package,version,project_id)) as unique_vuln
from "REPORTING"."MIGRATED_MARTS"."ISSUES"

where org_public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'
group by 1
order by 1 desc */

/*SELECT
  date_trunc('DAY',LAST_INTRODUCED) as last_introduced,
  count(concat(problem_id,project_id)) as new_vuln_c
  from "REPORTING"."MIGRATED_MARTS"."ISSUES"
  where date_trunc('DAY',LAST_INTRODUCED) <= current_date() --start
  and date_trunc('DAY',LAST_INTRODUCED) >= dateadd('DAY',-7,current_date()) --end
  and coalesce(last_disappeared,'1980-01-1 00:00:00.000 +0000') < dateadd('DAY',-7,current_date()) --end
  
  and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5'
group by 1
order by 1 desc
--prevous
and date_trunc('DAY',LAST_INTRODUCED) <= dateadd('DAY',-7,current_date()) --start
and date_trunc('DAY',LAST_INTRODUCED) >= dateadd('DAY',-14,current_date()) --end
--and DATE_COLUMN >= DATEADD('DAY', -(DATE_DIFF('end_date','start_date', day)), current_date())
--and DATE_COLUMN < DATEADD('end_date', -(DATE_DIFF('end_date','start_date', day)) day)
*/