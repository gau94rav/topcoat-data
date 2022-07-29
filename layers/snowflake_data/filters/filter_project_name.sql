

select project_id, project_name
from "DATA_PRODUCTS"."PROD_MARTS"."DIM_PROJECT_NAME"
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