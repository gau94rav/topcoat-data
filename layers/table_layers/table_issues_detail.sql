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
{% if filter('column_list') | selected_column('ISSUE_STATUS') %}ISSUE_STATE as ISSUE_STATUS,{% endif %}
{% if filter('column_list') | selected_column('LAST_INTRODUCED') %}LAST_INTRODUCED,{% endif %}
{% if filter('column_list') | selected_column('LAST_RESOLVED') %}LAST_DISAPPEARED as LAST_RESOLVED,{% endif %}
{% if filter('column_list') | selected_column('PRODUCT_NAME') %}PRODUCT_NAME,{% endif %}
{% if filter('column_list') | selected_column('PROJECT_CRITICALITY') %}CRITICALITY_DISPLAY as PROJECT_CRITICALITY,{% endif %}
{% if filter('column_list') | selected_column('PROJECT_ENVIRONMENT') %}ENVIRONMENT_DISPLAY as PROJECT_ENVIRONMENT,{% endif %}
{% if filter('column_list') | selected_column('PROJECT_LIFECYCLE') %}LIFECYCLE_DISPLAY as PROJECT_LIFECYCLE,{% endif %}
{% if filter('column_list') | selected_column('PROJECT_TAGS') %}KEY_VALUE_DISPLAY as PROJECT_TAGS,{% endif %}
{% if filter('column_list') | selected_column('PROJECT_TYPE') %}PROJECT_TYPE,{% endif %}
{% if filter('column_list') | selected_column('ORG_NAME') %}ORG_DISPLAY_NAME as ORG_NAME,{% endif %}
{% if filter('column_list') | selected_column('PROBLEM_ID') %}PROBLEM_ID,{% endif %}

{% if filter('column_list') | selected_column('LAST_IGNORED') %} LAST_IGNORED_AT as LAST_IGNORED,{% endif %}
{% if filter('column_list') | selected_column('PROJECT_OWNER') %}PROJECT_OWNER_USERNAME as PROJECT_OWNER,{% endif %}
{% if filter('column_list') | selected_column('PROJECT_ORIGIN') %}ORIGIN as PROJECT_ORIGIN,{% endif %}
{% if filter('column_list') | selected_column('PACKAGE_NAME') %}PACKAGE as PACKAGE_NAME,{% endif %}
{% if filter('column_list') | selected_column('PACKAGE_VERSION') %}VERSION as PACKAGE_VERSION,{% endif %}

ISSUE_URL,
VULN_DB_URL,
PROJECT_URL,
ISSUE_STATE AS ISSUE_STATUS_INDICATOR, -- CAN BE REMOVED IF WE UPDATE DBT TO ONLY POPULATE THE ISSUE_URL IF PRESENT & CHANGE THE TURL DEPENDENCY
ISSUE_TYPE,
RAW_ISSUE_TYPE as ORIGINAL_ISSUE_TYPE

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

{% if filter('problem_id') %}
and problem_id in ({{ filter('problem_id')| to_sql_list}})
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
                 (to_variant(tag_value_key) like '%"{{tag.value}}^_%' escape '^' and to_variant(tag_value_key) like '%^_{{tag.key}}"%' escape '^')
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

{% if filter('project_owner') %}
and project_owner_username in ({{ filter('project_owner')| to_sql_list}})
{% endif %}

{% if filter('project_origin') %}
and origin in ({{ filter('project_origin')| to_sql_list}})
{% endif %}

{% if filter('last_ignored_start') and filter('last_ignored_end') %}
and (to_date(last_ignored_at) >= '{{ filter('last_ignored_start') }}' 
and to_date(last_ignored_at) <= '{{ filter('last_ignored_end') }}')
{% endif %}

{% if filter('package_name') %}
and package in ({{ filter('package_name')| to_sql_list}})
{% endif %}

{% if filter('package_version') %}
and version in ({{ filter('package_version')| to_sql_list}})
{% endif %}

{% if filter('orderBy') %}
      order by  {{  filter('orderBy') }}
{% else %}
      order by priority_score desc, problem_title desc
{% endif %}

{% if filter('limit') %}
      LIMIT {{  filter('limit') }}
{% endif %}
{% if filter('offset') %}
      OFFSET {{  filter('offset') }}
{% endif %}

