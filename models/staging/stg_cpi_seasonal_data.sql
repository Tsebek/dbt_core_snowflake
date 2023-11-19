select
    timeseries.date as "Date"
    , timeseries.variable_name as "Variable Name"
    , timeseries.geo_id
    , timeseries.value as "Value"
    , timeseries.variable as "Variable"
    -- , src.*
from
    {{source('financial__economic_essentials','bureau_of_labor_statistics_price_timeseries')}} as timeseries
join {{source('financial__economic_essentials','bureau_of_labor_statistics_price_attributes')}} as attributes
on attributes.variable=timeseries.variable
where attributes.frequency='Monthly'
    and timeseries.variable ilike 'cpi%'
    and timeseries.variable ilike '%seasonally%'
group by all