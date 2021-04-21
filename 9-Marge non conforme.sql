/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select pp.Name_template as "Article" from product_product pp
left join product_template pt on pp.product_tmpl_id = pt.id
where coeff1_id <> 1 and pt.sale_ok is true and pt.active is true