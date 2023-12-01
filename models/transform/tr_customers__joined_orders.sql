-- tr_customers__joined_orders

select 
    customers.customer_id
    , customers.customer_city
    , customers.customer_state
    , orders.order_id
from {{ ref('stg_brazil_ecomm__customers') }} as customers
  left join {{ ref('stg_brazil_ecomm__orders') }} as orders
    on customers.customer_order_link = orders.customer_order_link
group by 1,2,3,4