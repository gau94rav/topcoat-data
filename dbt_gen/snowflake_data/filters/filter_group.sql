 
SELECT distinct group_public_id, group_name
from "DATA_PRODUCTS"."PROD_MARTS"."ISSUES"
where  (group_public_id IN ('group_id') OR org_public_id IN ('org_id')) 


 

 