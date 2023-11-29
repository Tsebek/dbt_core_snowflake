select 
    prod.product_id
    , prod.product_category_name as prod_name_br
    , tr.product_category_name_english as prod_name_en
from {{source('brazil_ecomm', 'OLIST_PRODUCTS_DATASET')}} prod
  join {{source('brazil_ecomm', 'PRODUCT_CATEGORY_NAME_TRANSLATION')}} tr
    on prod.PRODUCT_CATEGORY_NAME = tr.PRODUCT_CATEGORY_NAME
group by 1,2,3