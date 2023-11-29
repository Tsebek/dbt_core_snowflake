select 
    seller_id
    , seller_zip_code_prefix
    , seller_city
    , seller_state
from {{source('brazil_ecomm', 'OLIST_SELLERS_DATASET')}}
group by 1,2,3,4