/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    coalesce("tr".value, "pt".name) as "Nom",
    sum("poo".product_qty) as "Quantite vendue"
from
    report_pos_order as "poo"
    left join "product_template" as "pt" on "poo".product_tmpl_id = "pt".id
    left join ir_translation as "tr" on "tr".src = "pt".name
where
    cast("poo"."date" AS timestamp)  >= date_trunc('day', current_date - interval '30' day )
    and "pt".active is true
    and "pt".sale_ok is true
    and "poo".product_categ_id = 54
group by "Nom"
order by "Quantite vendue" desc
limit 100