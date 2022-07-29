{{config(
    type='line_chart'
)}}
SELECT
to_date(last_introduced), count(*)
from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"
where  (org_public_id IN ('4a3d29ab-6612-481b-83f2-aea6cf421ea5')) 

group by 1
order by 1 desc