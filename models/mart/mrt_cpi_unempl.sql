{{ 
config(
      materialized='incremental'
      , tags=["Fact Data"]
      , pre_hook ="ALTER WAREHOUSE dbt_dev_wh SET WAREHOUSE_SIZE ='XXLARGE'" 
      , post_hook="ALTER WAREHOUSE dbt_dev_wh SET WAREHOUSE_SIZE ='XSMALL'"
      ) 
}}

select
    cpi."Date"
    , cpi.geo_id
    , cpi.category as "Category"
    , cpi."Value" as "CPI Index"
from {{ref('tr_cpi_index')}} cpi
join {{ref('stg_geo_index')}} geo
on cpi.geo_id = geo.geo_id
where cpi.seasonal_adjustment = 'Y'

{% if is_incremental() %}
  -- this filter will only be applied on an incremental run
 WHERE ("Date", geo_id, "Category", "CPI Index") NOT IN (select "Date", geo_id, "Category", "CPI Index" from {{ this }})

{% endif %}