select

min(i.problem_id) as problem_id,
min (i.problem_title) as problem_title,
CASE WHEN i.problem_type = 'PACKAGE_VULNERABILITY' THEN i.problem_id ELSE i.natural_key END as groupby,
MIN(
    CASE WHEN i.problem_type = 'PACKAGE_VULNERABILITY' THEN 'Vulnerability'
    WHEN i.problem_type = 'LICENSE_VIOLATION' THEN 'License'
    WHEN i.problem_type = 'MISCONFIGURATION' THEN 'Configuration'
    else 'Code Vulnerability' end) as issue_type,
MIN(
    CASE WHEN i.problem_type = 'PACKAGE_VULNERABILITY' THEN CONCAT('${config.PVDB_HOST}/vuln/',i.problem_id)
    WHEN i.problem_type = 'LICENSE_VIOLATION' THEN CONCAT('${config.HOST}/vuln/',i.problem_id)
    WHEN i.problem_type = 'MISCONFIGURATION' THEN CONCAT('${config.HOST}/security-rules/',i.problem_id) END ) as url,
min(i.cve_identifiers) as cve,
min(i.cwe_identifiers) as cwe,
CASE
    WHEN MAX(CASE
          WHEN i.effective_severity = 'critical' THEN 3
          WHEN i.effective_severity = 'high' THEN 2
          WHEN i.effective_severity = 'medium' THEN 1
          WHEN i.effective_severity = 'low' THEN 0 END
          ) = 3 THEN 'Critical'
    WHEN MAX(CASE
          WHEN i.effective_severity = 'critical' THEN 3
          WHEN i.effective_severity = 'high' THEN 2
          WHEN i.effective_severity = 'medium' THEN 1
          WHEN i.effective_severity = 'low' THEN 0 END
          ) = 2 THEN 'High'
    WHEN MAX(CASE
          WHEN i.effective_severity = 'critical' THEN 3
          WHEN i.effective_severity = 'high' THEN 2
          WHEN i.effective_severity = 'medium' THEN 1
          WHEN i.effective_severity = 'low' THEN 0 END
          ) = 1 THEN 'Medium'
    WHEN MAX(CASE
          WHEN i.effective_severity = 'critical' THEN 3
          WHEN i.effective_severity = 'high' THEN 2
          WHEN i.effective_severity = 'medium' THEN 1
          WHEN i.effective_severity = 'low' THEN 0 END
          ) = 0 THEN 'Low' END as issue_severity,
min(i.original_severity) as original_Severity,
max(i.priority_score) as priority_score, 
--registry gihub has ('npm','yarn') = 'Node' but node isn't listed in the filter dropdown
min(case when p.type in ('npm','yarn','yarn-workspace') then 'JavaScript (npm or yarn)' 
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
      end) as project_type,
min(case when i.problem_type = 'CODE_SECURITY_VULNERABILITY' then 'Snyk Code' 
      when p.type in ('apk', 'deb', 'rpm','dockerfile','linux') then 'Snyk Container'
      when p.type in ('helmconfig','terraformconfig','cloudformationconfig','k8sconfig','armconfig') then 'Snyk IaC'
      when i.problem_type in ('MISCONFIGURATION') then 'Snyk IaC' 
      when i.problem_type in ('PACKAGE_VULNERABILITY','LICENSE_VIOLATION') then 'Snyk Open Source' end) as product_name,
max(case when sca.exploit_maturity = 'proof-of-concept' then 'Proof of Concept'
when sca.exploit_maturity = 'mature' then 'Mature'
when sca.exploit_maturity = 'no-known-exploit' then 'No Known Exploit'
else 'No Data' end) as exploit_maturity,
max(sca.package_name) as package,
max(sca.package_version) as version,
max(case when sca.reachability = 'function' then 'Reachable'
when sca.reachability = 'package' then 'Potentially Reachable'
when sca.reachability = 'not-reachable' then 'Not Reachable'
else 'No Path Found' end) as reachability,
max(case when (coalesce(IS_UPGRADEABLE, false) = true and coalesce(IS_PATCHABLE, false) = false and coalesce(IS_PINNABLE, false) = false) then 'Upgrade' 
when (coalesce(IS_UPGRADEABLE, false) = true and coalesce(IS_PATCHABLE, false) = true and coalesce(IS_PINNABLE, false) = false) then 'Upgrade, Patch'
when (coalesce(IS_UPGRADEABLE, false) = true and coalesce(IS_PATCHABLE, false) = false and coalesce(IS_PINNABLE, false) = true) then 'Upgrade, Pin'
when (coalesce(IS_UPGRADEABLE, false) = false and coalesce(IS_PATCHABLE, false) = true and coalesce(IS_PINNABLE, false) = false) then 'Patch'
when (coalesce(IS_UPGRADEABLE, false) = false and coalesce(IS_PATCHABLE, false) = true and coalesce(IS_PINNABLE, false) = true) then 'Patch, Pin'
when (coalesce(IS_UPGRADEABLE, false) = false and coalesce(IS_PATCHABLE, false) = false and coalesce(IS_PINNABLE, false) = true) then 'Pin'
else 'Not Auto Fixable' end) as autofixable,
count(distinct i.project_id) as project_count

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

where {{ authorized_orgs('o.public_id', 'g.public_id') }}
{% if filter('orgs') %}
and o.public_id = '{{ filter('orgs')}}'
{% endif %}
{% if filter('groups') %}
and g.public_id in ({{ filter('groups')| to_sql_list}})
{% endif %}

--and o.public_id = '4c62f811-1816-4896-a91d-22577bb8eaca' -- financial apps
--and o.public_id = '4a3d29ab-6612-481b-83f2-aea6cf421ea5' --app sec
and p.deleted is null
and i.deleted is null

group by CASE WHEN i.problem_type = 'PACKAGE_VULNERABILITY' THEN i.problem_id ELSE i.natural_key END

order by priority_score desc

{% if filter('limit') %}
      LIMIT {{  filter('limit') }}
{% endif %}
{% if filter('offset') %}
      OFFSET {{  filter('offset') }}
{% endif %}
