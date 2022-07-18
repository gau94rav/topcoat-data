SELECT 'products' as key, 'All Products' as value
UNION ALL
SELECT 'cloud' as key, 'Cloud' as value
UNION ALL
SELECT 'opensource' as key, 'Open Source' as value
UNION ALL
SELECT 'snykcode' as key, 'Snyk Code' as value
UNION ALL
SELECT 'iac' as key, 'IaC' as value
{{column(
    name='KEY',
    tags=["keys", "options"]
)}}
{{column(
    name='VALUE',
    tags=["values", "labels"]
)}}