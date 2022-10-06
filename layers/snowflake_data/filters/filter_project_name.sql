

select project_id, project_name


from "REPORTING"."MIGRATED_MARTS"."DIM_PROJECT_NAME"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('orgs') %}
and org_public_id in ({{ filter('orgs') | to_sql_list}})
{% endif %}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}
and is_monitored = true

order by 2



{{ column(
 name='PROJECT_NAME',
 tags=['names']
)}} 

{{ column(
 name='PROJECT_ID',
 tags=['ids']
)}} 