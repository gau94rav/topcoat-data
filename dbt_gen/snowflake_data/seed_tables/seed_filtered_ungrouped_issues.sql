select 
project_id,
project_name,  
problem_id, 
problem_title,
first_introduced,
org_public_id,
issue_type,
url,
cve,
cwe,
issue_severity,
INITCAP(original_Severity) as original_severity,
priority_score, 
project_type,
product_name,
issue_id,
exploit_maturity,
package,
version,
INITCAP(is_upgradeable) as is_upgradeable,
INITCAP(is_patchable) as is_patchable,
INITCAP(is_pinnable) as is_pinnable,
reachability,
autofixable,
lifecycle,
environment,
criticality,
project_owner_user_id,
INITCAP(is_currently_present) as is_currently_present,
INITCAP(is_currently_ignored) as is_currently_ignored,
tag_value_key,
group_public_id,
group_name

from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4"

where  (group_public_id IN ('group_id') OR org_public_id IN ('org_id')) 

and org_public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'













and INITCAP(is_currently_ignored) = 'False'



and INITCAP(is_currently_present) = 'True'