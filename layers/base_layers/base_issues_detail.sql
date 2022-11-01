select 
    project_id,
    project_name,
    project_public_id,
    issue_id,
    issue_public_id,
    problem_id, 
    problem_title,
    org_public_id,
    org_id,
    org_display_name,
    org_name,
    group_id,
    group_public_id,
    group_name,
    project_owner_user_id,
    first_introduced,
    last_introduced,
    last_disappeared,
    last_ignored,
    issue_modified,
    raw_issue_type,
    issue_type,
    url,
    cve,
    cwe,
    INITCAP(issue_severity) as issue_severity,
    INITCAP(original_Severity) as original_severity,
    priority_score, 
    raw_project_type,
    project_type,
    product_name,
    exploit_maturity,
    package,
    version,
    INITCAP(is_upgradeable) as is_upgradeable,
    INITCAP(is_patchable) as is_patchable,
    INITCAP(is_pinnable) as is_pinnable,
    autofixable,
    lifecycle,
    environment,
    criticality,
    INITCAP(is_currently_present) as is_currently_present,
    INITCAP(is_currently_ignored) as is_currently_ignored,
    tag_value_key,
    project_url,
    issue_url,
    VULN_DB_URL,
    CONFIGURATION_URL,
    LICENSE_URL,
    grouped_by_key,
    issue_state,
    was_issue_reintroduced,
    last_ignored_at,
    project_owner_email,
    project_owner_username,
    branch,
    origin

from "REPORTING"."MIGRATED_MARTS"."ISSUES"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}
and is_monitored = true
and __is_deleted_calculated = false
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
and INITCAP(issue_severity) in ({{ filter('issue_severity')| to_sql_list}})
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

{% if filter('package_name') %}
and package in ({{ filter('package_name')| to_sql_list}})
{% endif %}

{% if filter('package_version') %}
and version in ({{ filter('package_version')| to_sql_list}})
{% endif %}

{% if filter('last_ignored_start') and filter('last_ignored_end') %}
and (to_date(last_ignored_at) >= '{{ filter('last_ignored_start') }}' 
and to_date(last_ignored_at) <= '{{ filter('last_ignored_end') }}')
{% endif %}

{% if filter('problem_id') %}
and problem_id in ({{ filter('problem_id')| to_sql_list}})
{% endif %}
