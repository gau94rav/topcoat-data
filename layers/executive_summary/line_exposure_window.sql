{{config(
    type='exec_line_chart',
    title='Exposure Window',
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

SELECT
date_day,
count(case when days_open > 30 then grouped_by_key else null end)  as thirty,
count(case when days_open >= 15 and days_open <= 30 then grouped_by_key else null end)  as fifteen_thirty,
count(case when days_open <= 14 then grouped_by_key else null end)  as fifteen

  from {{ref('issues_cross_join')}}
where date_day <= '{{ filter('issue_summary_end') }}'
and date_day >= '{{ filter('issue_summary_start') }}'
and last_introduced > coalesce(last_disappeared,'1980-01-1 00:00:00.000 +0000') 

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