
 
select distinct project_type

from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V3"
where 1=1
{% if filter('orgs') %}
and org_public_id = '{{ filter('orgs')}}'
{% endif %}

{{ column(
 name='PROJECT_TYPE',
 tags=['ids','names']
)}} 
