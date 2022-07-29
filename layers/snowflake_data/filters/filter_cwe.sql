SELECT distinct
key,
value
from "DATA_PRODUCTS"."PROD_MARTS"."DIM_CWE"
where 1=1
{% if filter('orgs') %}
and org_public_id = '{{ filter('orgs')}}'
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