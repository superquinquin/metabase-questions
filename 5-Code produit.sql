/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select product_product.product_tmpl_id, product_product.name_template  from product_product where product_product.name_template like {{Produit}}