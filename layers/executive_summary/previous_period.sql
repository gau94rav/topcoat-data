
select
'merge' as merge,
--date_trunc('DAY',LAST_INTRODUCED) as last,
--date_trunc('DAY',to_date(last_disappeared)) as disappeared,
count(concat(problem_id,package,version,project_id)) as unique_vuln_p
from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"

where org_public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'
and date_trunc('DAY',LAST_INTRODUCED) <= dateadd('DAY',-7,current_date()) --start
and date_trunc('DAY',LAST_INTRODUCED) >= dateadd('DAY',-14,current_date()) --end
group by 1
order by 1 desc






--Something like this...
--and DATE_COLUMN >= DATEADD('DAY', -(DATE_DIFF('end_date','start_date', day)), current_date())
--and DATE_COLUMN < DATEADD('end_date', -(DATE_DIFF('end_date','start_date', day)) day)