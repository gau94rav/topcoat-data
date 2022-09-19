 select 
  date_day, 
  last_introduced, 
  org_public_id, 
  org_display_name, 
  project_id, 
  project_name,  
  grouped_by_key as problem_id,
  datediff('DAY', to_date(LAST_INTRODUCED),date_day) as days_open 

  from {{ref('seed_executive_summary')}}
  cross join "DATA_PRODUCTS"."PROD_MARTS"."DATE_TABLE" d
  where date_day >= last_introduced and date_day <= current_date()
  and last_introduced > coalesce(last_disappeared,'1980-01-1 00:00:00.000 +0000') 
  --and last_disappeared is null