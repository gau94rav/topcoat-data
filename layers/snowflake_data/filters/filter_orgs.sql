
 
SELECT distinct org_public_id, org_display_name
from "REPORTING"."MIGRATED_MARTS"."ISSUES"
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

