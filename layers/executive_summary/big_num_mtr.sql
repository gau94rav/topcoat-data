with mtr as (SELECT
  date_trunc('DAY',to_date(LAST_INTRODUCED)) as last_introduced,
  
  datediff('DAY',
  date_trunc('DAY',to_date(last_disappeared)),
  date_trunc('DAY',LAST_INTRODUCED)
   ) as days_to_disappear,

concat(problem_id,project_id) as unique_vuln

  from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"
  
  where 1=1
  and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5'

order by 1 desc)


SELECT
avg( case when
    (date_trunc('DAY',to_date(last_disappeared)) <= current_date() --start
  and date_trunc('DAY',to_date(last_disappeared)) >= dateadd('DAY',-7,current_date())) --end)
  then unique_vuln else null end) as mtr_c
-- need previous
  from mtr