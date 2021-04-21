/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

SELECT
    case
        when "pc".parent_id != 0 then "mc".name
        else "pc".name
    end as "Categorie",
    sum("rpo".price_total_vat_excl) AS "Total HT",
    sum("rpo".price_total) AS "Total TTC"
FROM 
    report_pos_order as "rpo"
    join product_category as "pc" on "pc".id = cast("rpo".product_categ_id as int)
    join (select id, name from product_category) as "mc" on "mc".id = "pc".parent_id
where
    extract(year from "rpo"."date") = {{var_year}}
GROUP BY "Categorie"
order by "Total TTC" desc