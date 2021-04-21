/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    product_template.name as "Product Tmpl Name",
    ir_translation.src as "Source",
    ir_translation.value as "Traduction"
from product_template
left join ir_translation on product_template.name = ir_translation.src
where
    product_template.active = true
    and product_template.sale_ok = true
    and ir_translation.src != ir_translation.value
order by "Source"