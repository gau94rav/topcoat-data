SELECT ISSUE_SEVERITY,
PRIORITY_SCORE,
PROBLEM_ID,
ISSUE_TYPE,
PROBLEM_TITLE,
CVE,
CWE,
PROJECT_NAME,
EXPLOIT_MATURITY,
AUTOFIXABLE,
LAST_INTRODUCED,
IS_CURRENTLY_PRESENT,
PRODUCT_NAME

from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4"
where  (group_public_id IN ('group_id') OR org_public_id IN ('org_id')) 

and org_public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'













and INITCAP(is_currently_ignored) = 'False'



and INITCAP(is_currently_present) = 'True'




















order by priority_score desc, problem_title desc
 