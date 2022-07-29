with open as ( -- this is wrong..
  select
  date_trunc('DAY',to_date(LAST_INTRODUCED)) as last_introduced,
  count(concat(problem_id,package,version,project_id)) as open_vuln_c
  from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"
  where 1=1
  --date filter?
  and is_currently_present = 'True'
  and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5'
  group by 1
order by 1 desc
),

new as (
  SELECT
  date_trunc('DAY',to_date(LAST_INTRODUCED)) as last_introduced, -- rolling? fill in missing dates?
  count(concat(problem_id,package,version,project_id)) as new_vuln_c
  from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"
  where date_trunc('DAY',LAST_INTRODUCED) <= current_date() --start
  and date_trunc('DAY',LAST_INTRODUCED) >= dateadd('DAY',-7,current_date()) --end
  and is_currently_present = 'True'
  and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5'
group by 1
order by 1 desc
),

resolved as (
  SELECT
  date_trunc('DAY',to_date(last_disappeared)) as disappeared,
  count(concat(problem_id,package,version,project_id)) as resolved_vuln_c
  from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"
  where date_trunc('DAY',to_date(last_disappeared)) <= current_date() --start
  and date_trunc('DAY',to_date(last_disappeared)) >= dateadd('DAY',-7,current_date()) --end
  and is_currently_present = 'False'
  and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5'
group by 1
order by 1 desc
),

mtr as (
  SELECT
  date_trunc('DAY',to_date(LAST_INTRODUCED)) as last_introduced,
  avg(datediff('DAY',
  date_trunc('DAY',to_date(last_disappeared)),
  date_trunc('DAY',LAST_INTRODUCED)
   )) as days_to_disappear,
  count(concat(problem_id,package,version,project_id)) as mtr_vuln_c
  from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"
  where date_trunc('DAY',to_date(last_disappeared)) <= current_date() --start
  and date_trunc('DAY',to_date(last_disappeared)) >= dateadd('DAY',-7,current_date()) --end
  and is_currently_present = 'False'
  and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5'
group by 1
order by 1 desc
)



select
o.last_introduced,
open_vuln_c,
new_vuln_c,
resolved_vuln_c,
days_to_disappear
from open o
left join new n
on o.last_introduced = n.last_introduced
left join resolved r
on o.last_introduced = r.disappeared
left join mtr 
on o.last_introduced = mtr.last_introduced

--where org_public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'
--and date_trunc('DAY',LAST_INTRODUCED) <= current_date() --start
----and date_trunc('DAY',LAST_INTRODUCED) >= dateadd('DAY',-7,current_date()) --end
--group by 1
order by 1 desc