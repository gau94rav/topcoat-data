SELECT 'Topcoat' AS Company,100 AS Users
UNION ALL
SELECT 'Snyk',200
UNION ALL
SELECT 'Microsoft',300
UNION ALL
SELECT 'Google',800
UNION ALL
SELECT 'Amazon',900
UNION ALL
SELECT 'FossId',800;

{{column(
    name='Company',
    tags=['options','labels']
)}}

{{column(
    name='Company',
    tags=['ids','names']
)}}