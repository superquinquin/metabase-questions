/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    "pc".name as "Sous-catégorie",
    case
        when "tr".value!='' then "tr".value
        else "pt".name
    end as "Nom produit",
    "pt".base_price as "Prix d'achat HT"
from
    product_product as "pp"
    inner join product_template as "pt" on "pp".product_tmpl_id = "pt".id
    left join ir_translation as "tr" on "pt".name = "tr".src
    left join "product_category" as "pc" on "pt".categ_id = "pc".id
where
    "pt".active is true
    and "pt".sale_ok is true
    and ("pc".id = 53 or "pc".id = 54)
order by "Sous-catégorie", "Nom produit"