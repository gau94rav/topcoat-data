

SELECT distinct
value,
       key
FROM  "DATA_PRODUCTS"."PROD_MARTS"."DIM_PROJECT_TAGS"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}

{% if filter('orgs') %}
and org_public_id = '{{ filter('orgs')}}'
{% endif %}

order by 1


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