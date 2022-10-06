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