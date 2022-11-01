select distinct package_name


from "REPORTING"."MIGRATED_MARTS"."DIM_PACKAGE_NAME_VERSION"
where {{ authorized_orgs('org_public_id', 'group_public_id') }}
{% if filter('orgs') %}
and org_public_id in ({{ filter('orgs') | to_sql_list}})
{% endif %}
{% if filter('groups') %}
and group_public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}
and package_name is not null

order by 1



{{ column(
 name='PACKAGE_NAME',
 tags=['names','ids']
)}} 