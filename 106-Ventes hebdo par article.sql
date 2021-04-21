/* 
 -------- Description --------

Graphique des ventes hebdomadaires


 -------- Filters translation -------- 

{{ var_article }} -> product_product.name_template 

 -------- SQL -------- */

select
    product_product.name_template as "Article",
    date_trunc('week', pos_order_line.create_date) as "Date",
    sum(pos_order_line.qty) as "Quantité"
from pos_order_line
inner join product_product on product_product.id = pos_order_line.product_id
where
   cast(pos_order_line.create_date as date) >= cast({{var_date_begin}}::timestamp as date)
   [[and cast(pos_order_line.create_date as date) <= cast({{var_date_end}}::timestamp as date)]]
   and pos_order_line.qty > 0
   [[and {{var_article}}]]
group by "Article", "Date"