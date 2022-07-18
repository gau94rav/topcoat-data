

select distinct project_id, project_name
from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V3"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('orgs') %}
and org_public_id = '{{ filter('orgs')}}'
{% endif %}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}
order by 2



{{ column(
 name='PROJECT_NAME',
 tags=['names']
)}} 

{{ column(
 name='PROJECT_ID',
 tags=['ids']
)}} 