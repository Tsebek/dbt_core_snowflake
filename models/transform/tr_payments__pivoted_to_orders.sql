-- tr_payments__pivoted_to_orders

select 
    order_id
    , sum(payment_value) as order_amount
from {{ ref('stg_brazil_ecomm__order_payments') }}
group by 1
