SELECt
    COUNT(CASE WHEN product_name = 'Snyk Code' THEN 1 else null END) AS snyk_code,
    COUNT(CASE WHEN product_name = 'Snyk Container' THEN 1 else null END) AS snyk_container,
    COUNT(CASE WHEN product_name = 'Snyk IaC' THEN 1 else null END) AS snyk_iac,
    COUNT(CASE WHEN product_name = 'Snyk Open Source' THEN 1 else null END) AS snyk_open_source
FROM
   {{ref('base_issues_detail')}}
WHERE
    1=1



    /* COUNT(CASE WHEN product_name = 'Snyk Code' THEN 1 END) AS snyk_code,
    COUNT(CASE WHEN product_name = 'Snyk Container' THEN 1 END) AS snyk_container,
    COUNT(CASE WHEN product_name = 'Snyk IaC' THEN 1 END) AS snyk_iac,
    COUNT(CASE WHEN product_name = 'Snyk Open Source' THEN 1 END) AS snyk_open_source,*/