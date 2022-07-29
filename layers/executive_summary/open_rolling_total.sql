select
  date_trunc('day', LAST_introduced) as last_introduced,
  count(concat(problem_id,package,version,project_id)) as open_vuln_c
  from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"
  where 1=1
  and date_trunc('DAY',LAST_INTRODUCED) <= current_date() --start
  and last_introduced > coalesce(last_disappeared,'1980-01-1 00:00:00.000 +0000')
  and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5' -- '4c62f811-1816-4896-a91d-22577bb8eaca'
  group by 1
order by 1 desc
)
select last_introduced, 
sum(open_vuln_c) over (order by last_introduced asc rows between unbounded preceding and current row)
from a 


--how to do for the table by org or project?
