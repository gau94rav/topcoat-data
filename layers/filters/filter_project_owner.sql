
select distinct project_owner_username as project_owner


from "REPORTING"."MIGRATED_MARTS"."DIM_PROJECT_OWNER"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('orgs') %}
and org_public_id in ({{ filter('orgs') | to_sql_list}})
{% endif %}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}
and is_monitored = true
and project_owner_username is not null
order by 1



{{ column(
 name='PROJECT_OWNER',
 tags=['names','ids']
)}} 