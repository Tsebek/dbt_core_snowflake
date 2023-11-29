-- mrt__orders

select
    orders.order_id
    , orders.order_status
    , orders.order_date
    , products.prod_name_en
    , sum(order_payments.order_amount) as order_amount
from {{ ref('stg_brazil_ecomm__orders') }} as orders
    left join {{ ref('tr_payments__pivoted_to_orders') }} as order_payments 
            on orders.order_id = order_payments.order_id
    left join {{ ref('tr_order_items__joined_products_sellers') }} as products
            on orders.order_id = products.order_id
group by 1,2,3,4