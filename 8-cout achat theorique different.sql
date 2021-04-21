/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select name from product_template where (has_theoritical_cost_different) and sale_ok = 'true' and active = 'true'