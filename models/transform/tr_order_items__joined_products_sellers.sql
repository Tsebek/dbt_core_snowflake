-- tr_order_items__joined_products_sellers
  
select 
    items.order_id
    , items.order_item_id
    , items.product_id
    , items.seller_id
    , products.prod_name_en
    , sellers.seller_city
    , sellers.seller_state
from {{ ref('stg_brazil_ecomm__order_items') }} as items
    left join {{ ref('stg_brazil_ecomm__products') }} as products
            on items.product_id = products.product_id
    left join {{ ref('stg_brazil_ecomm__sellers') }} as sellers
            on items.seller_id = sellers.seller_id
group by all
