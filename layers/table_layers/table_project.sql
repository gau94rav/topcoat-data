SELECT
p.org_display_name,
p.org_name,
p.project_id,
p.project_name,
p.project_url,
all_c-ope.resolved_c as open_current,
all_p-ope.resolved_p as open_previous,
new_c as new_current,
new_p as new_previous,
res.resolved_c as resolved_current,
res.resolved_p as resolved_previous,
mtr_c as mtr_current,
mtr_p as mtr_previous
from (select distinct org_display_name, org_name, project_name, project_id, project_url from {{ref('base_issues_summary')}}) p
full outer join {{ ref('table_project_mtr')}} mtr
on mtr.project_id = p.project_id
full outer join {{ ref('table_project_new')}} new
on p.project_id = new.project_id
full outer join {{ ref('table_project_resolved')}} res
on p.project_id = res.project_id
full outer join {{ ref('table_project_open')}} ope
on p.project_id = ope.project_id

{% if filter('orderBy') %}
      order by  {{  filter('orderBy') }}
{% else %}
      order by 6 desc
{% endif %}

{% if filter('limit') %}
LIMIT {{  filter('limit') }}
{% endif %}
{% if filter('offset') %}
OFFSET {{  filter('offset') }}
{% endif %}