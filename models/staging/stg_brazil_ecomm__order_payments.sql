select order_id,
       payment_sequential,
       payment_type,
       payment_installments,
       payment_value
from {{source('brazil_ecomm', 'OLIST_ORDER_PAYMENTS_DATASET')}}