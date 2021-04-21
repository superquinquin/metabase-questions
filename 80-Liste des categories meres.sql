/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    distinct "parents".name as "Catégorie mère"
from
    product_category
    join (select id, name from product_category) as parents on "parents".id = product_category.parent_id
order by "Catégorie mère" asc