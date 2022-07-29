
  SELECT
  date_trunc('DAY',LAST_INTRODUCED) as last_introduced,
  count(concat(problem_id,project_id)) as new_vuln_c
  from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"
  where date_trunc('DAY',LAST_INTRODUCED) <= current_date() --start
  and date_trunc('DAY',LAST_INTRODUCED) >= dateadd('DAY',-7,current_date()) --end
  and coalesce(last_disappeared,'1980-01-1 00:00:00.000 +0000') < dateadd('DAY',-7,current_date()) --end
  
  and org_public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5'
group by 1
order by 1 desc