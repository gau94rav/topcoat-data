{{config(
    type='exec_line_chart',
    title='Issues Identified and Resolved',
    dimensions=[1],
    y_title='Cumulative Issues',
    y_grid='show',
    line_colors=['#D8082D','#004D54'],
    fill_colors=['#D8082D80','#004D5480'],
    hover_font_color='#ffffff',
    hover_font_size='14',
    hover_label_bg='#1C1C21',
    legend='show',
    legend_orientation='h',
    legend_traceorder='reversed',
    legend_x='0.859',
    fill_type='no fill',
    line_type='linear'
)}}


select 
    last_introduced, 
   resolved_vuln as resolved_issues,
   open_vuln as open_issues
from {{ref('resolved_open_join')}} 
where last_introduced <= '{{ filter('exec_summary_end') }}'
and last_introduced >= '{{ filter('exec_summary_start') }}'


{{column(
    name='OPEN_ISSUES',
    label='Identified'
)}}

{{column(
    name='RESOLVED_ISSUES',
    label='Resolved'
)}}