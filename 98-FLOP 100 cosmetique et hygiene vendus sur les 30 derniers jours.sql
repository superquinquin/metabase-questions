/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    case
        when "tr".value!='' then "tr".value
        else "pt".name
    end as "Nom",
    sum("poo".product_qty) as "Quantite vendue"
from
    report_pos_order as "poo"
    left join "product_template" as "pt" on "poo".product_tmpl_id = "pt".id
    left join ir_translation as "tr" on "tr".src = "pt".name
    left join "product_category" as "pc" on "poo"."product_categ_id" = "pc"."id"
    left join (select id, name from "product_category") as "parents" on "parents"."id" = "pc"."parent_id"
where
    cast("poo"."date" AS timestamp)  >= date_trunc('day', current_date - interval '30' day )
    and "pt".active is true
    and "pt".sale_ok is true
    and "pc".id = 82
group by "Nom", "pc".id, "parents"."id"
order by "Quantite vendue" asc
limit 100