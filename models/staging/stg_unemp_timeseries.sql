select
    date as "Date"
    , geo_id
    , variable_name as "Variable Name"
    , value as "Value"
    -- , src.*
from {{source('financial__economic_essentials', 'bureau_of_labor_statistics_employment_timeseries')}} src
where
    variable_name = 'Local Area Unemployment: Unemployment Rate, Seasonally adjusted, Monthly'
    -- AND date >= '2000-01-01'
group by all