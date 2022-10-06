select 
date_day as last_introduced, 
date_day as last_disappeared,
 0 as resolved_vuln,
  0 as open_vuln
from "REPORTING"."MIGRATED_MARTS"."DATE_TABLE" 
where date_day <= current_date()