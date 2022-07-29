SELECT distinct 
       -- 'Environment' as key,
       split_part(trim(F.value, '"'),'_',0) AS value,
       split_part(trim(F.value, '"'),'_',2) AS key
FROM  "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4" pa, 
       Table(Flatten(pa.tag_value_key)) F
where {{ authorized_orgs('pa.org_public_id', 'pa.group_public_id') }}

{% if filter('orgs') %}
and org_public_id = '{{ filter('orgs')}}'
{% endif %}
--and o.public_id = '4c62f811-1816-4896-a91d-22577bb8eaca' -- financial apps
--and o.public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5' --app sec
--and key is not null
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