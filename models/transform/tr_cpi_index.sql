
select 
    "Date"
    , geo_id
    , split_part(replace("Variable", 'CPI:_', ''), ',', 1) as category
    , case 
        when "Variable" ilike '%,_not_seasonally_adjusted%' then 'N'
        when "Variable" ilike '%,_seasonally_adjusted%' then 'Y'
    end as seasonal_adjustment
    , "Value"
from {{ref('stg_cpi_seasonal_data')}}