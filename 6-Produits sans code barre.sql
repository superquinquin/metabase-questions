/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select pp.Name_template from product_product pp
left join product_template pt on pp.product_tmpl_id = pt.id
where pp.barcode is null and pt.sale_ok is true and pt.active is true