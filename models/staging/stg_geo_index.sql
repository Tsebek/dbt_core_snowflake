select distinct
    geo_id
    , geo_name as "Geo Name"
    , level as "Level"
    -- , src.*
FROM {{source('financial__economic_essentials', 'geography_index')}} src
where iso_name is not null
GROUP BY all