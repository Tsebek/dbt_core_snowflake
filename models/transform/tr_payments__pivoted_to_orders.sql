-- tr_payments__pivoted_to_orders

select 
    order_id
    , payment_type
    , sum(payment_value) as order_amount
    -- , sum(case when payment_type = 'credit_card' then payment_value else 0 end) as credit_card_amount
    -- , sum(case when payment_type = 'boleto' then payment_value else 0 end) as boleto_amount
    -- , sum(case when payment_type = 'voucher' then payment_value else 0 end) as voucher_amount
    -- , sum(case when payment_type = 'debit_card' then payment_value else 0 end) as debit_card_amount
    -- , sum(case when payment_type = 'not_defined' then payment_value else 0 end) as not_defined_amount
from {{ ref('stg_brazil_ecomm__order_payments') }}
group by 1,2
