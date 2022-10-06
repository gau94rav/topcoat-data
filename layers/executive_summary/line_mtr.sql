{{config(
    type='exec_line_chart',
    title='Time to Resolve by Week',
    y_title='Issues',
    dimensions=[1],
    y_grid='show',
    line_colors=['#E27122','#2D9283','#0F47C6'],
    fill_colors=['#FDD3B6','#B4E4D9','#B5CCFA'],
    hover_font_color='#ffffff',
    hover_font_size='14',
    hover_label_bg='#1C1C21',
    legend='show',
    legend_orientation='h',
    legend_traceorder='reversed',
    legend_x='0.535',
    line_type='linear',
    fill_type='previous y',
    stacked='yes'
)}}


select
last_disappeared_week,
count(case when days_to_disappear > 30 then grouped_by_key else null end)  as thirty,
count(case when days_to_disappear <= 30 and days_to_disappear >= 15 then grouped_by_key else null end)  as fifteen_thirty,
count(case when days_to_disappear <= 14 then grouped_by_key else null end)  as fifteen
from
(select 
date_trunc('WEEK',last_disappeared) as last_disappeared_week,
--to_date(last_disappeared) as last_disappeared_week,
grouped_by_key,
datediff('DAY', to_date(LAST_INTRODUCED),(case when last_disappeared is null then null else to_date(last_disappeared) end)) as days_to_disappear
   from {{ ref('seed_executive_summary')}}
   where 1=1
     and last_disappeared is not null
and last_disappeared > last_introduced
)
where 1=1
and last_disappeared_week <= '{{ filter('issue_summary_end') }}'
and last_disappeared_week >= '{{ filter('issue_summary_start') }}'
group by 1
order by 1 desc



{{column(
    name='FIFTEEN',
    label='< 15 days'
)}}

{{column(
    name='FIFTEEN_THIRTY',
    label='15-30 days'
)}}

{{column(
    name='THIRTY',
    label='> 30 days'
)}}