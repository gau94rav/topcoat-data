select
p.id as project_id,
p.name as project_name,
o.public_id as org_public_id,
o.id as org_id,
o.display_name as org_display_name,
g.id as group_id,
g.public_id as group_public_id,
g.name as group_name,
case when p.type in ('npm','yarn','yarn-workspace') then 'JavaScript (npm or yarn)' 
      when p.type in ('rubygems') then 'Ruby (rubygems)'
      when p.type in ('maven','gradle') then 'Java (maven or gradle)'
      when p.type in ('sbt') then 'Scala (sbt)'
      when p.type in ('pip','poetry') then 'Python (pip or poetry)'
      when p.type in ('golang', 'golangdep', 'govendor', 'gomodules') then 'Go (golangdep, govendor or gomodules)'
      when p.type in ('cocoapods') then 'Swift / Objective-C (cocoapods)'
      when p.type in ('composer') then 'PHP (composer)'
      when p.type in ('hex') then 'Elixir (hex)'
      when p.type in ('nuget', 'paket') then '.NET (nuget or paket)'
      when p.type in ('apk', 'deb', 'rpm') then 'Docker (apk, deb or rpm)'
      when p.type in ('dockerfile') then 'Dockerfile (dockerfile)'
      when p.type in ('cpp') then 'C/C++ (cpp)'
      when p.type in ('terraformconfig') then 'Terraform (terraformconfig)'
      when p.type in ('k8sconfig') then 'Kubernetes (k8sconfig)'
      when p.type in ('helmconfig') then 'Helm (helmconfig)'
      when p.type in ('cloudformationconfig') then 'CloudFormation (cloudformationconfig)'
      when p.type in ('sast') then 'Static Application Security Testing (SAST)'
                        when p.type in ('linux') then 'Linux (linux)'
                        when p.type in ('armconfig') then 'ARM Configuration (armconfig)'
      end as project_type,

pa.lifecycle,
pa.environment,
pa.criticality,

STRTOK_TO_ARRAY(concat(t.value, '_',t.key), ',') as tag_value_key

from "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."ISSUES" i
left join "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."PROJECTS" p
on i.project_id = p.id
left join "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."ORGS" o
on p.org_id = o.id
left join "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."ISSUES_SCA_DATA" sca
on i.id = sca.issue_id
left join "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."PROJECT_ATTRIBUTES" pa
on pa.project_id = p.id
left join "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."USERS" u
on u.id = p.owner_user_id
left join "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."GROUPS" g
on o.group_id = g.id
left join "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."PROJECT_TAGS" pt
on p.id = pt.project_id
left join "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."TAGS" t
on pt.tag_id = t.id


where  (g.public_id IN ('group_id') OR o.public_id IN ('org_id')) 

and o.public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'



and p.deleted is null