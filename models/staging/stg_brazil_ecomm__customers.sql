select 
    customer_id as customer_order_link
    , customer_unique_id as customer_id
    , customer_zip_code_prefix
    , customer_city
    , customer_state
from {{source('brazil_ecomm', 'OLIST_CUSTOMERS_DATASET')}}
group by 1,2,3,4,5