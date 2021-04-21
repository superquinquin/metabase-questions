/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    case
        when "tr".value!='' then "tr".value
        else "pt".name
    end as "Nom",
    "pp".barcode,
    "br".name as "Regle code barre",
    "pu".name as "Unite produit"
from
    product_template as "pt"
    left join ir_translation as "tr" on "tr".src = "pt".name
    inner join product_product as "pp" on "pp".product_tmpl_id = "pt".id
    inner join product_uom as "pu" on "pt".uom_id = "pu".id
    inner join barcode_rule as "br" on "pp".barcode_rule_id = "br".id
where
    "pt".active is true
    and "pt".sale_ok is true
    and "pu".id = 1
    and "pp".barcode_rule_id = 12