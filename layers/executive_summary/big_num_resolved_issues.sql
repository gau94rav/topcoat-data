SELECT
  count( case when 
    (date_trunc('DAY',to_date(last_disappeared)) <= current_date() --start
  and date_trunc('DAY',to_date(last_disappeared)) >= dateadd('DAY',-7,current_date())) --end
  then concat(problem_id,project_id) else null end) as resolved_vuln_c,
count( case when 
    (date_trunc('DAY',to_date(last_disappeared)) <= dateadd('DAY',-7,current_date()) --start
    and date_trunc('DAY',to_date(last_disappeared)) >= dateadd('DAY',-14,current_date())) --end
  then concat(problem_id,project_id) else null end) as resolved_vuln_p

from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"
  where 1=1
  and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5'
