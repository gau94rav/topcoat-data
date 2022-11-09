

select distinct f.project_id, f.project_name, p.project_public_id


from "REPORTING"."MIGRATED_MARTS"."DIM_PROJECT_NAME" f
left join "REPORTING"."MIGRATED_MARTS"."PROJECTS" p
on f.project_id = p.project_id
where {{ authorized_orgs('f.org_public_id', 'f.group_public_id') }}
{% if filter('orgs') %}
and f.org_public_id in ({{ filter('orgs') | to_sql_list}})
{% endif %}
{% if filter('groups') %}
and f.group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}
and f.is_monitored = true
and project_deleted is null

order by 2



{{ column(
 name='PROJECT_NAME',
 tags=['names']
)}} 

{{ column(
 name='PROJECT_PUBLIC_ID',
 tags=['ids']
)}} 