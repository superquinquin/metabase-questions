/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select name from product_template where (has_theoritical_price_different is true) and sale_ok = 'true' and active = 'true'