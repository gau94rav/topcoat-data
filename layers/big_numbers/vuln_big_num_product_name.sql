SELECt
    COUNT(distinct CASE WHEN product_name = 'Snyk Code' THEN problem_id else null END) AS snyk_code,
    COUNT(distinct CASE WHEN product_name = 'Snyk Container' THEN problem_id else null END) AS snyk_container,
    COUNT(distinct CASE WHEN product_name = 'Snyk IaC' THEN problem_id else null END) AS snyk_iac,
    COUNT(distinct CASE WHEN product_name = 'Snyk Open Source' THEN problem_id else null END) AS snyk_open_source
FROM
   {{ref('base_issues_detail')}}
WHERE
    1=1