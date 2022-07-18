SELECT distinct
        'CVE' as key,
       trim(F.value, '"') AS value 
FROM   "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4" pa, 
       Table(Flatten(pa.CVE)) F
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