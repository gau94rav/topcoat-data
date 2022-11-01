---WIP
SELECT
o.org_display_name,
o.org_name,
o.org_public_id,
all_c-ope.resolved_c as open_current,
all_p-ope.resolved_p as open_previous,
new_c as new_current,
new_p as new_previous,
res.resolved_c as resolved_current,
res.resolved_p as resolved_previous,
mtr_c as mtr_current,
mtr_p as mtr_previous
from (select distinct org_display_name, org_public_id, org_name from {{ref('base_issues_summary')}}) o
full outer join {{ ref('table_org_resolved')}} res
on o.org_public_id = res.org_public_id
full outer join {{ ref('table_org_new')}} new
on o.org_public_id = new.org_public_id
full outer join {{ ref('table_org_mtr')}} mtr
on o.org_public_id = mtr.org_public_id
full outer join {{ ref('table_org_open')}} ope
on o.org_public_id = ope.org_public_id

{% if filter('orderBy') %}
      order by  {{  filter('orderBy') }}
{% else %}
      order by 4 desc
{% endif %}

{% if filter('limit') %}
LIMIT {{  filter('limit') }}
{% endif %}
{% if filter('offset') %}
OFFSET {{  filter('offset') }}
{% endif %}

