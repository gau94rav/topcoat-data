



select distinct product_name
from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V3"
where 1=1
{% if filter('orgs') %}
and org_public_id = '{{ filter('orgs')}}'
{% endif %}





{{ column(
 name='PRODUCT_NAME',
 tags=['names','ids']
)}} 