/* 
 -------- Description --------




 -------- Filters translation -------- 

{{ var_product }} -> product_template.name 

 -------- SQL -------- */

select
    "total"."rolling_month",
    "total"."month" as "Mois",
    sum(case when "total"."date" <= date_trunc('month', current_date - interval '6' month ) then "total"."qty" else 0 end) as "Quantite vendue l'année dernière",
    sum(case when "total"."date" >= date_trunc('month', current_date - interval '6' month ) then "total"."qty" else 0 end) as "Quantite vendue cette année"
from
    (select
        date_trunc('month', "poo".date) as "date",
        to_char("poo".date, 'Mon') as "month",
        case
            when extract(month from "poo".date) > extract(month from current_date) + 5 then extract(month from "poo".date) - (extract(month from current_date) + 5)
            else extract(month from "poo".date) + (12 - (extract(month from current_date) + 5))
        end as "rolling_month",
        sum("poo".product_qty) as "qty"
    from
        report_pos_order as "poo"
        left join "product_template" on "poo".product_tmpl_id = "product_template".id
    where
        {{var_product}}
        and "poo".date >= date_trunc('month', current_date - interval '18' month )
    group by "date") as "total"
group by "total"."rolling_month", "Mois"
order by "total"."rolling_month"