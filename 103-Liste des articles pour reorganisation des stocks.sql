/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    "pp".barcode as "Code barre",
    case
        when "tr".value!='' then "tr".value
        else "pt".name
    end as "Nom produit",
    "pt".weight_net as "Poids",
    "parents_cat".name as "Catégorie mère",
    "pc".name as "Sous-catégorie",
    "pu".name as "Unité de vente",
    "ps".package_qty as "Colisage",
    "ps".min_qty as "Quantité mini de commande"
from
    product_product as "pp"
    inner join product_template as "pt" on "pp".product_tmpl_id = "pt".id
    left join ir_translation as "tr" on "pt".name = "tr".src
    left join "product_category" as "pc" on "pt".categ_id = "pc".id
    left join (select id, name from "product_category") as "parents_cat" on "parents_cat"."id" = "pc"."parent_id"
    left join "product_supplierinfo" as "ps" on "ps".product_tmpl_id = "pt".id
    left join "product_uom" as "pu" on "pu".id = "pt".uom_id
where
    "pt".active is true
    and "pt".purchase_ok is true
    and "parents_cat".id != 52 -- Sans produits frais
    and "parents_cat".id != 104 -- Sans Autres
order by "Catégorie mère"