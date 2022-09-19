SELECT distinct
key,
value
from "DATA_PRODUCTS"."PROD_MARTS"."DIM_CVE"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('orgs') %}
and org_public_id in ({{ filter('orgs') | to_sql_list}})
{% endif %}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}

order by 2

{{ column(
   name='KEY',
   tags=['keys']
)
}}
{{ column(
   name='VALUE',
   tags=['values']
)
}}