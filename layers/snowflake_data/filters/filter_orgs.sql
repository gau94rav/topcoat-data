
 
SELECT distinct org_public_id, org_display_name
from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}

{{ column(
 name='ORG_DISPLAY_NAME',
 tags=['names']
)}} 

{{ column(
 name='ORG_PUBLIC_ID',
 tags=['ids']
)}} 

