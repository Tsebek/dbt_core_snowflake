-- mrt__customers

select 
    customers.customer_id
    , customers.customer_city
    , customers.customer_state
    , sum(order_amount) as order_amount
from {{ ref('tr_customers__joined_orders') }} as customers
   left join {{ ref('tr_payments__pivoted_to_orders') }} as payments
     on customers.order_id = payments.order_id
group by 1,2,3