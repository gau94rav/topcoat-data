--sql used in v4 of the snowflake table

select
p.id as project_id,
p.name as project_name,
i.id as issue_id,
i.public_id as issue_public_id,
i.problem_id as problem_id, 
i.problem_title as problem_title,
o.public_id as org_public_id,
o.id as org_id,
o.display_name as org_display_name,
g.id as group_id,
g.public_id as group_public_id,
g.name as group_name,
u.id as project_owner_user_id,
i.first_introduced,
i.last_introduced,

CASE WHEN i.problem_type = 'PACKAGE_VULNERABILITY' THEN 'Vulnerability'
    WHEN i.problem_type = 'LICENSE_VIOLATION' THEN 'License'
    WHEN i.problem_type = 'MISCONFIGURATION' THEN 'Configuration'
    else 'Code Vulnerability' end as issue_type,

CASE WHEN i.problem_type = 'PACKAGE_VULNERABILITY' THEN CONCAT('${config.PVDB_HOST}/vuln/',i.problem_id)
    WHEN i.problem_type = 'LICENSE_VIOLATION' THEN CONCAT('${config.HOST}/vuln/',i.problem_id)
    WHEN i.problem_type = 'MISCONFIGURATION' THEN CONCAT('${config.HOST}/security-rules/',i.problem_id) END  as url,
i.cve_identifiers as cve,
i.cwe_identifiers as cwe,
CASE
    WHEN CASE
          WHEN i.effective_severity = 'critical' THEN 3
          WHEN i.effective_severity = 'high' THEN 2
          WHEN i.effective_severity = 'medium' THEN 1
          WHEN i.effective_severity = 'low' THEN 0 END
           = 3 THEN 'Critical'
    WHEN CASE
          WHEN i.effective_severity = 'critical' THEN 3
          WHEN i.effective_severity = 'high' THEN 2
          WHEN i.effective_severity = 'medium' THEN 1
          WHEN i.effective_severity = 'low' THEN 0 END
           = 2 THEN 'High'
    WHEN CASE
          WHEN i.effective_severity = 'critical' THEN 3
          WHEN i.effective_severity = 'high' THEN 2
          WHEN i.effective_severity = 'medium' THEN 1
          WHEN i.effective_severity = 'low' THEN 0 END
           = 1 THEN 'Medium'
    WHEN CASE
          WHEN i.effective_severity = 'critical' THEN 3
          WHEN i.effective_severity = 'high' THEN 2
          WHEN i.effective_severity = 'medium' THEN 1
          WHEN i.effective_severity = 'low' THEN 0 END
           = 0 THEN 'Low' END as issue_severity,
i.original_severity as original_Severity,
i.priority_score as priority_score, 
p.type as raw_project_type,
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
case when i.problem_type = 'CODE_SECURITY_VULNERABILITY' then 'Snyk Code' 
      when p.type in ('apk', 'deb', 'rpm','dockerfile','linux') then 'Snyk Container'
      when p.type in ('helmconfig','terraformconfig','cloudformationconfig','k8sconfig','armconfig') then 'Snyk IaC'
      when i.problem_type in ('MISCONFIGURATION') then 'Snyk IaC' 
      when i.problem_type in ('PACKAGE_VULNERABILITY','LICENSE_VIOLATION') then 'Snyk Open Source' end as product_name,
case when sca.exploit_maturity = 'proof-of-concept' then 'Proof of Concept'
when sca.exploit_maturity = 'mature' then 'Mature'
when sca.exploit_maturity = 'no-known-exploit' then 'No Known Exploit'
else 'No Data' end as exploit_maturity,
sca.package_name as package,
sca.package_version as version,
sca.is_upgradeable,
sca.is_patchable,
sca.is_pinnable,
case when sca.reachability = 'function' then 'Reachable'
when sca.reachability = 'package' then 'Potentially Reachable'
when sca.reachability = 'not-reachable' then 'Not Reachable'
else 'No Path Found' end as reachability,

case when (coalesce(IS_UPGRADEABLE, false) = true and coalesce(IS_PATCHABLE, false) = false and coalesce(IS_PINNABLE, false) = false) then 'Upgrade' 
when (coalesce(IS_UPGRADEABLE, false) = true and coalesce(IS_PATCHABLE, false) = true and coalesce(IS_PINNABLE, false) = false) then 'Upgrade, Patch'
when (coalesce(IS_UPGRADEABLE, false) = true and coalesce(IS_PATCHABLE, false) = false and coalesce(IS_PINNABLE, false) = true) then 'Upgrade, Pin'
when (coalesce(IS_UPGRADEABLE, false) = false and coalesce(IS_PATCHABLE, false) = true and coalesce(IS_PINNABLE, false) = false) then 'Patch'
when (coalesce(IS_UPGRADEABLE, false) = false and coalesce(IS_PATCHABLE, false) = true and coalesce(IS_PINNABLE, false) = true) then 'Patch, Pin'
when (coalesce(IS_UPGRADEABLE, false) = false and coalesce(IS_PATCHABLE, false) = false and coalesce(IS_PINNABLE, false) = true) then 'Pin'
else 'Not Auto Fixable' end as autofixable,

pa.lifecycle,
pa.environment,
pa.criticality,

i.is_currently_present,
i.is_currently_ignored,

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
and i.deleted is null