SELECT
ISSUE_SEVERITY,
{% if filter('column_list') | selected_column('PRIORITY_SCORE') %}PRIORITY_SCORE,{% endif %}
PROBLEM_TITLE,
{% if filter('column_list') | selected_column('CVE') %}CVE,{% endif %}
{% if filter('column_list') | selected_column('CWE') %}CWE,{% endif %}
{% if filter('column_list') | selected_column('PROJECT_NAME') %}PROJECT_NAME,{% endif %}
{% if filter('column_list') | selected_column('EXPLOIT_MATURITY') %}EXPLOIT_MATURITY,{% endif %}
{% if filter('column_list') | selected_column('AUTOFIXABLE') %}AUTOFIXABLE,{% endif %}
{% if filter('column_list') | selected_column('FIRST_INTRODUCED') %}FIRST_INTRODUCED,{% endif %}
{% if filter('column_list') | selected_column('ISSUE_STATE') %}ISSUE_STATE,{% endif %}
{% if filter('column_list') | selected_column('LAST_INTRODUCED') %}LAST_INTRODUCED,{% endif %}
{% if filter('column_list') | selected_column('LAST_DISAPPEARED') %}LAST_DISAPPEARED,{% endif %}
{% if filter('column_list') | selected_column('PRODUCT_NAME') %}PRODUCT_NAME,{% endif %}
{% if filter('column_list') | selected_column('CRITICALITY_DISPLAY') %}CRITICALITY_DISPLAY,{% endif %}
{% if filter('column_list') | selected_column('ENVIRONMENT_DISPLAY') %}ENVIRONMENT_DISPLAY,{% endif %}
{% if filter('column_list') | selected_column('LIFECYCLE_DISPLAY') %}LIFECYCLE_DISPLAY,{% endif %}
{% if filter('column_list') | selected_column('KEY_VALUE_DISPLAY') %}KEY_VALUE_DISPLAY,{% endif %}
{% if filter('column_list') | selected_column('PROJECT_TYPE') %}PROJECT_TYPE,{% endif %}
{% if filter('column_list') | selected_column('REACHABILITY') %}REACHABILITY,{% endif %}

ISSUE_URL,
PROJECT_URL,
ISSUE_STATE AS ISSUE_STATUS_INDICATOR, -- CAN BE REMOVED IF WE UPDATE DBT TO ONLY POPULATE THE ISSUE_URL IF PRESENT & CHANGE THE TURL DEPENDENCY
ISSUE_TYPE,
PROBLEM_ID

from "REPORTING"."MIGRATED_MARTS"."ISSUES"

where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('orgs') %}
and org_public_id in ({{ filter('orgs') | to_sql_list}})
{% endif %}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}

and is_monitored = true
and __is_deleted_calculated = false
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
and issue_state in ({{ filter('issue_status')| to_sql_list}})
{% endif %}

{% if filter('criticality') is iterable %}
and (
{% for tag in filter('criticality') | to_sql_tags %}
INITCAP(to_variant(criticality)) like '%{{tag.value}}%'
{% if not loop.last %}
or
{% endif %}
{% endfor %}
)
{% endif %}

{% if filter('environment') is iterable %}
and (
{% for tag in filter('environment') | to_sql_tags %}
INITCAP(to_variant(environment)) like '%{{tag.value}}%'
{% if not loop.last %}
or
{% endif %}
{% endfor %}
)
{% endif %}

{% if filter('lifecycle') is iterable %}
and (
{% for tag in filter('lifecycle') | to_sql_tags %}
INITCAP(to_variant(lifecycle)) like '%{{tag.value}}%'
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
to_variant(cve) like '%"{{tag.value}}"%'
{% if not loop.last %}
or
{% endif %}
{% endfor %}
)
{% endif %}

{% if filter('cwe') is iterable %}
and (
{% for tag in filter('cwe') | to_sql_tags %}
to_variant(cwe) like '%"{{tag.value}}"%'
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
