
 
-- SELECT distinct org_public_id, org_display_name
-- from {{ref('seed_filtered_ungrouped_issues')}}
-- where {{ authorized_orgs('org_public_id', 'group_public_id') }}

select org_name, org_public_id, org_display_name, group_name
from "REPORTING"."MIGRATED_MARTS"."ISSUES"
Where {{ authorized_orgs('org_public_id', 'group_public_id') }}
LIMIT 1
