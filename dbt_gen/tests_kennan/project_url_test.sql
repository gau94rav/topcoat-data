select distinct 
o.public_id as o_public_id,
o.display_name, 
o.name as o_name,
ot.source_type,
ot.target_data, 
ot.upstream_url, 
p.name, 
p.public_id as p_public_id,
p.id as p_id,
p.origin,
p.target_file, 
p.target_ref,
replace(p.name, ':', concat('/blob/',p.target_ref,'/')),

case when ot.upstream_url is not null then ot.upstream_url
when p.name like '%:%' then replace(p.name, ':', concat('/blob/',p.target_ref,'/'))
else p.name end as github_url


from "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."ORGS" o
left join "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."ORG_TARGETS" ot
on ot.org_id = o.id
left join "STITCH_INGESTION"."POSTGRESQL__PROD__SNOWFLAKE"."PROJECTS" p
on p.org_target_id = ot.id



where 1=1 

and o.public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'

and o.public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'