with all_issues as (
  select
  date_trunc('day', LAST_introduced) as last_introduced,
  count(concat(problem_id,project_id)) as open_vuln
  from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES" -- ref
  where 1=1
  and last_introduced > coalesce(last_disappeared,'1980-01-1 00:00:00.000 +0000')
  and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5' -- '4c62f811-1816-4896-a91d-22577bb8eaca'

  group by 1
order by 1 desc
), 
rolling_sum as (
select 
last_introduced, 
sum(open_vuln) over (order by last_introduced asc rows between unbounded preceding and current row) as open
from all_issues
)

select 
sum(case when to_date(last_introduced) = current_date() then open else null end) as open_c,
sum(case when to_date(last_introduced) = dateadd('day',-7,current_date()) then open else null end) as open_p
from rolling_sum
