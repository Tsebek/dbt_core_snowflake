select 
    order_id
    , customer_id as customer_order_link
    , order_status
    , date(order_purchase_timestamp) as order_date
    , date(order_approved_at) as order_approved_date
    , date(order_delivered_carrier_date) as order_delivered_carrier_date
    , date(order_delivered_customer_date) as order_delivered_customer_date
    , date(order_estimated_delivery_date) as order_estimated_delivery_date
from {{source('brazil_ecomm', 'OLIST_ORDERS_DATASET')}}
group by all