SELECT

ISSUE_SEVERITY,
PRIORITY_SCORE,
PROBLEM_ID,
ISSUE_TYPE,
PROBLEM_TITLE,
CVE,
CWE,
PROJECT_NAME,
EXPLOIT_MATURITY,
AUTOFIXABLE,
LAST_INTRODUCED,
FIRST_INTRODUCED as INTRODUCED,
--IS_CURRENTLY_PRESENT,
PRODUCT_NAME,
PROJECT_URL,
ISSUE_URL,

    case when is_currently_present = false then 'Resolved'
when is_currently_present = true and is_currently_ignored = false then 'Open'
else 'Ignored' end as issue_status

from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"

where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('orgs') %}
and org_public_id in ({{ filter('orgs') | to_sql_list}})
{% endif %}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}

{% if filter('min') and filter('max') %}
and (priority_score between '{{ filter('min') }}' and '{{ filter('max') }}')
{% endif %}

{% if filter('introduced_start') and filter('introduced_end') %}
and (to_date(first_introduced) >= '{{ filter('introduced_start') }}' 
and to_date(first_introduced) <= '{{ filter('introduced_end') }}')
{% endif %}

{% if filter('last_disappeared_start') and filter('last_disappeared_end') %}
and (to_date(last_disappeared) >= '{{ filter('last_disappeared_start') }}' 
and to_date(last_disappeared) <= '{{ filter('last_disappeared_end') }}')
{% endif %}

{% if filter('last_introduced_start') and filter('last_introduced_end') %}
and (to_date(last_introduced) >= '{{ filter('last_introduced_start') }}' 
and to_date(last_introduced) <= '{{ filter('last_introduced_end') }}')
{% endif %}

{% if filter('project_name') %}
and project_id in ({{ filter('project_name')| to_sql_list}})
{% endif %}

{% if filter('issue_status') %}
and issue_status in ({{ filter('issue_status')| to_sql_list}})
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
{% endif %}

{% if filter('status') %}
and INITCAP(is_currently_present) in ({{ filter('status')| to_sql_list}})
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

{% if filter('autofixable') == 'True' %}
and autofixable != 'No'
{% elif filter('autofixable') == 'False' %}
and autofixable = 'No'
{% endif %}

{% if filter('exploit_maturity') %}
and exploit_maturity in ({{ filter('exploit_maturity')| to_sql_list}})
{% endif %}

{% if filter('tags') is iterable %}
 and (
      {% for tag in filter('tags') | to_sql_tags %}
                 (to_variant(tag_value_key) like '%"{{tag.value}}_%' and to_variant(tag_value_key) like '%_{{tag.key}}"%')
            {% if not loop.last %}
                  or
            {% endif %} 
      {% endfor %}
 )
{% endif %}

{% if filter('cve') is iterable %}
and (
{% for tag in filter('cve') | to_sql_tags %}
cve like '%"{{tag.value}}"%'
{% if not loop.last %}
or
{% endif %}
{% endfor %}
)
{% endif %}

{% if filter('cwe') is iterable %}
and (
{% for tag in filter('cwe') | to_sql_tags %}
cwe like '%"{{tag.value}}"%'
{% if not loop.last %}
or
{% endif %}
{% endfor %}
)
{% endif %}

order by priority_score desc, problem_title desc
 {% if filter('limit') %}
LIMIT {{  filter('limit') }}
{% endif %}
{% if filter('offset') %}
OFFSET {{  filter('offset') }}
{% endif %}
