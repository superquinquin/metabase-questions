/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select count(*)
from product_template
where
    active is true
    and purchase_ok is true
    and sale_ok is true