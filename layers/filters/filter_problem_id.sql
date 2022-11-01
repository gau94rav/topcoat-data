SELECT distinct problem_id
from "REPORTING"."MIGRATED_MARTS"."ISSUES"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('orgs') %}
and org_public_id in ({{ filter('orgs') | to_sql_list}})
{% endif %}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}
and problem_id is not null

{{ column(
 name='PROBLEM_ID',
 tags=['ids','names']
)}} 