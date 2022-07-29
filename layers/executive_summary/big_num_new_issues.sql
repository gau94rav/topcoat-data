


select

count(case when 
    (date_trunc('DAY',LAST_INTRODUCED) <= current_date() --start
  and date_trunc('DAY',LAST_INTRODUCED) >= dateadd('DAY',-7,current_date())) 
  then concat(problem_id,project_id) else null end) as new_vuln_c,
count(case when 
    (date_trunc('DAY',LAST_INTRODUCED) <= dateadd('DAY',-7,current_date())
and date_trunc('DAY',LAST_INTRODUCED) >= dateadd('DAY',-14,current_date())) 
  then concat(problem_id,project_id) else null end) as new_vuln_p

from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES" --seed layer
where 1=1
and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5'




