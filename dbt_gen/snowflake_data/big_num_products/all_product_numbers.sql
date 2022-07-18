SELECt
    1000 AS critical,
    1000 AS high,
    1000 AS medium,
    1000 AS low,
    COUNT(*) AS total,
    COUNT(distinct problem_id) AS total_unique
FROM
   {{ ref('seed_filtered_ungrouped_issues') }}
WHERE
    1=1



    /* COUNT(CASE WHEN product_name = 'Snyk Code' THEN 1 END) AS snyk_code,
    COUNT(CASE WHEN product_name = 'Snyk Container' THEN 1 END) AS snyk_container,
    COUNT(CASE WHEN product_name = 'Snyk IaC' THEN 1 END) AS snyk_iac,
    COUNT(CASE WHEN product_name = 'Snyk Open Source' THEN 1 END) AS snyk_open_source,*/