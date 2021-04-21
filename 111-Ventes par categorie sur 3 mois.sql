/* 
 -------- Description --------




 -------- Filters translation -------- 

{{ var_category }} -> product_category.name 

 -------- SQL -------- */

select
    "per_month_total"."nom" as "Nom produit",
    "per_month_total"."prix_ttc" as "Prix TTC",
    "per_month_total"."prix_kg" as "Prix/kg",
    sum(case when "per_month_total"."month" = -3 then "per_month_total"."qty" else 0 end) as "Quantite vendue m-3",
    sum(case when "per_month_total"."month" = -2 then "per_month_total"."qty" else 0 end) as "Quantite vendue m-2",
    sum(case when "per_month_total"."month" = -1 then "per_month_total"."qty" else 0 end) as "Quantite vendue m-1",
    sum(case when "per_month_total"."month" = 0 then "per_month_total"."qty" else 0 end) as "Quantite vendue m"
from
    (
    select
        coalesce(ir_translation.value, "pt".name) AS "nom",
        "pt".list_price as "prix_ttc",
        case
            when "pt".weight_net > 0 then "pt".list_price / "pt".weight_net
            else -1
        end as "prix_kg",
        extract(month from "poo".date)-extract(month from current_date) as "month",
        sum("poo".product_qty) as "qty"
    from
        report_pos_order as "poo"
        left join "product_template" as "pt" on "poo".product_tmpl_id = "pt".id
        left join "product_category" on "poo"."product_categ_id" = "product_category"."id"
        LEFT JOIN ir_translation ON ir_translation.res_id = "pt".id AND ir_translation.name = 'product.template,name'
    where
        "poo".date >= date_trunc('month', current_date - interval '3' month )
        and "pt".active is true
        and "pt".sale_ok is true
        [[and {{var_category}}]]
    group by "nom", "prix_ttc", "prix_kg", "month"
    ) as per_month_total
group by "Nom produit", "Prix TTC", "Prix/kg"
order by "Quantite vendue m-1" desc