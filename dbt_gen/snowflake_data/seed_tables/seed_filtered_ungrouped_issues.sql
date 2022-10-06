select 
project_id,
    project_name,
    project_public_id,
    issue_id,
    issue_public_id,
    problem_id, 
    problem_title,
    org_public_id,
    org_id,
    org_display_name,
    org_name,
    group_id,
    group_public_id,
    group_name,
    project_owner_user_id,
    first_introduced,
    last_introduced,
    --last_disappeared, --incorrect data type. will be fixed soon
    last_ignored,
    modified,
    raw_issue_type,
    issue_type,
    url,
    cve,
    cwe,
    INITCAP(issue_severity) as issue_severity,
    INITCAP(original_Severity) as original_severity,
    priority_score, 
    raw_project_type,
    project_type,
    product_name,
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
    INITCAP(is_currently_present) as is_currently_present,
    INITCAP(is_currently_ignored) as is_currently_ignored,
    tag_value_key,
    project_url

--from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4"
from "REPORTING"."MIGRATED_MARTS"."ISSUES"
where  (group_public_id IN ('group_id') OR org_public_id IN ('org_id')) 

and org_public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'













and INITCAP(is_currently_ignored) = 'False'



and INITCAP(is_currently_present) = 'True'