select
    cpi."Date"
    , cpi.geo_id
    , cpi.category as "Category"
    , cpi."Value" as "CPI Index"
from {{ref('tr_cpi_index')}} cpi
join {{ref('stg_geo_index')}} geo
on cpi.geo_id = geo.geo_id
where cpi.seasonal_adjustment = 'Y'