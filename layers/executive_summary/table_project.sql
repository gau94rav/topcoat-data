SELECT
p.org_display_name,
p.project_id,
p.project_name,
all_c-ope.resolved_c as open_c,
all_p-ope.resolved_p as open_p,
new_c,
new_p,
res.resolved_c,
res.resolved_p,
mtr_c,
mtr_p
from (select distinct org_display_name, project_name, project_id from {{ref('seed_executive_summary')}}) p
full outer join {{ ref('table_project_mtr')}} mtr
on mtr.project_id = p.project_id
full outer join {{ ref('table_project_new')}} new
on p.project_id = new.project_id
full outer join {{ ref('table_project_resolved')}} res
on p.project_id = res.project_id
full outer join {{ ref('table_project_open')}} ope
on p.project_id = ope.project_id
order by 3 desc
{% if filter('limit') %}
LIMIT {{  filter('limit') }}
{% endif %}
{% if filter('offset') %}
OFFSET {{  filter('offset') }}
{% endif %}