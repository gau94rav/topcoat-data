SELECT distinct
        'CVE' as key,
       trim(F.value, '"') AS value 
FROM   "SANDBOX"."TC_TEST"."ALL_ISSUES_CLUSTERED_TEST_V4" pa, 
       Table(Flatten(pa.CVE)) F
where 1=1

and org_public_id = '4c62f811-1816-4896-a91d-22577bb8eaca'


order by 2