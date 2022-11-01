select 
    date_day, 
    last_introduced,
    last_disappeared,
    org_public_id, 
    org_display_name, 
    org_name,
    project_id, 
    project_name,
    grouped_by_key, 
    datediff('DAY', to_date(last_introduced),(case when last_disappeared is null then date_day else to_date(last_disappeared) end)) as days_open,
   datediff('DAY', to_date(LAST_INTRODUCED),(case when last_disappeared is null then null else to_date(last_disappeared) end)) as days_to_disappear

    from  {{ref('base_issues_summary')}}
    cross join "REPORTING"."MIGRATED_MARTS"."DATE_TABLE" d
    where date_day >= to_date(last_introduced) and date_day <= (case when last_disappeared is null then current_date() else to_date(last_disappeared) end)
 