select distinct origin


from "REPORTING"."MIGRATED_MARTS"."DIM_PROJECT_ORIGIN"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('orgs') %}
and org_public_id in ({{ filter('orgs') | to_sql_list}})
{% endif %}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}
and is_monitored = true
and origin is not null
order by 1


{{ column(
 name='ORIGIN',
 tags=['names','ids']
)}} 