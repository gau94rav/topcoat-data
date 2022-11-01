SELECT
    COUNT(CASE WHEN lower(issue_severity) = 'critical' THEN 1 else null END) AS critical,
    COUNT(CASE WHEN lower(issue_severity) = 'high' THEN 1 else null END) AS high,
    COUNT(CASE WHEN lower(issue_severity) = 'medium' THEN 1 else null END) AS medium,
    COUNT(CASE WHEN lower(issue_severity) = 'low' THEN 1 else null END) AS low
FROM
   {{ref('base_issues_detail')}}
WHERE
    1=1