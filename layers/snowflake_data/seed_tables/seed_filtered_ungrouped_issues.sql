select 
project_id,
project_name,  
problem_id, 
problem_title,
first_introduced,
org_public_id,
issue_type,
url,
cve,
cwe,
issue_severity,
INITCAP(original_Severity) as original_severity,
priority_score, 
project_type,
product_name,
issue_id,
exploit_maturity,
package,
version,
INITCAP(is_upgradeable) as is_upgradeable,
INITCAP(is_patchable) as is_patchable,
INITCAP(is_pinnable) as is_pinnable,
reachability,
autofixable,
lifecycle,
environment,
criticality,
project_owner_user_id,
INITCAP(is_currently_present) as is_currently_present,
INITCAP(is_currently_ignored) as is_currently_ignored,
tag_value_key,
group_public_id,
group_name

from "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4"

where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('orgs') %}
and org_public_id = '{{ filter('orgs')}}'
{% endif %}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}

{% if filter('project_name') %}
and project_id in ({{ filter('project_name')| to_sql_list}})
{% endif %}

{% if filter('criticality') is iterable %}
and (
{% for tag in filter('criticality') | to_sql_tags %}
INITCAP(criticality) like '%{{tag.value}}%'
{% if not loop.last %}
or
{% endif %}
{% endfor %}
)
{% endif %}

{% if filter('environment') is iterable %}
and (
{% for tag in filter('environment') | to_sql_tags %}
INITCAP(environment) like '%{{tag.value}}%'
{% if not loop.last %}
or
{% endif %}
{% endfor %}
)
{% endif %}

{% if filter('lifecycle') is iterable %}
and (
{% for tag in filter('lifecycle') | to_sql_tags %}
INITCAP(lifecycle) like '%{{tag.value}}%'
{% if not loop.last %}
or
{% endif %}
{% endfor %}
)
{% endif %}


{% if filter('ignored') %}
and INITCAP(is_currently_ignored) in ({{ filter('ignored')| to_sql_list}})
{% else %}
and INITCAP(is_currently_ignored) = 'False'
{% endif %}

{% if filter('status') %}
and INITCAP(is_currently_present) in ({{ filter('status')| to_sql_list}})
{% else %}
and INITCAP(is_currently_present) = 'True'
{% endif %}

{% if filter('project_type') %}
and project_type in ({{ filter('project_type')| to_sql_list}})
{% endif %}

{% if filter('issue_type') %}
and issue_type in ({{ filter('issue_type')| to_sql_list}})
{% endif %}
{% if filter('issue_severity') %}
and issue_severity in ({{ filter('issue_severity')| to_sql_list}})
{% endif %}
{% if filter('product_name') %}
and product_name in ({{ filter('product_name')| to_sql_list}})
{% endif %}

{% if filter('reachability') %}
and reachability in ({{ filter('reachability')| to_sql_list}})
{% endif %}

{% if filter('autofixable') %}
and autofixable in ({{ filter('autofixable')| to_sql_list}})
{% endif %}

{% if filter('exploit_maturity') %}
and exploit_maturity in ({{ filter('exploit_maturity')| to_sql_list}})
{% endif %}

{% if filter('start_date') and filter('start_date') %}
--AND to_date(last_introduced) BETWEEN '{{ filter('start_date') }}' AND '{{ filter('end_date') }}'
{% endif %}


{% if filter('tags') is iterable %}
 and (
      {% for tag in filter('tags') | to_sql_tags %}
                 (to_variant(tag_value_key) like '%{{tag.value}}%' and to_variant(tag_value_key) like '%{{tag.key}}%')
            {% if not loop.last %}
                  or
            {% endif %} 
      {% endfor %}
 )
{% endif %}

{% if filter('cve') is iterable %}
and (
{% for tag in filter('cve') | to_sql_tags %}
cve like '%{{tag.value}}%'
{% if not loop.last %}
or
{% endif %}
{% endfor %}
)
{% endif %}

{% if filter('cwe') is iterable %}
and (
{% for tag in filter('cwe') | to_sql_tags %}
cwe like '%{{tag.value}}%'
{% if not loop.last %}
or
{% endif %}
{% endfor %}
)
{% endif %}


