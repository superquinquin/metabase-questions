/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    coalesce("tr".value, product_template.name) as "Nom produit",
    product_coefficient.name as "Marge",
    product_coefficient.value as "Valeur"
from product_template
left join product_coefficient on product_template.coeff9_id = product_coefficient.id
left join ir_translation as "tr" on product_template.name = "tr".src
where
    product_template.active = true
    and product_template.sale_ok = true
    and product_template.is_capital_fundraising = false
    and product_template.base_price > 0
    and (product_template.coeff9_id is null
        or product_coefficient.value < 0.2)