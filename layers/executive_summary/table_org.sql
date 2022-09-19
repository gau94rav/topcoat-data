---WIP
SELECT
o.org_display_name,
o.org_public_id,
all_c-ope.resolved_c as open_c,
all_p-ope.resolved_p as open_p,
new_c,
new_p,
res.resolved_c,
res.resolved_p,
mtr_c,
mtr_p
from (select distinct org_display_name, org_public_id from {{ref('seed_executive_summary')}}) o
full outer join {{ ref('table_org_resolved')}} res
on o.org_display_name = res.org_display_name
full outer join {{ ref('table_org_new')}} new
on o.org_display_name = new.org_display_name
full outer join {{ ref('table_org_mtr')}} mtr
on o.org_display_name = mtr.org_display_name
full outer join {{ ref('table_org_open')}} ope
on o.org_display_name = ope.org_display_name
order by 2 desc
{% if filter('limit') %}
LIMIT {{  filter('limit') }}
{% endif %}
{% if filter('offset') %}
OFFSET {{  filter('offset') }}
{% endif %}

