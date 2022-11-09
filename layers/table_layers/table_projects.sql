select 
project_public_id,
project_id,
project_name,
org_public_id,
group_public_id,
project_type,
autofixable,
project_url,
--key_value_display,
problem_id,
issue_state,
first_introduced,
problem_title,
issue_url

from {{ref('base_issues_detail')}}

{% if filter('issue_id') %}
    where problem_id = '{{filter('issue_id')}}'
{% endif %}

order by 2

{% if filter('limit') %}
LIMIT {{  filter('limit') }}
{% endif %}
{% if filter('offset') %}
OFFSET {{  filter('offset') }}
{% endif %}