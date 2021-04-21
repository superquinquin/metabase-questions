/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    case
        when "tr".value!='' then "tr".value
        else "pt".name
    end as "Nom produit",
    rp.name as "Cree par"
from
    product_template as "pt"
    inner join res_users as "ru" on pt.create_uid = ru.id
    inner join res_partner as "rp" on ru.partner_id = rp.id
    left join ir_translation as "tr" on pt.name = tr.src
where
    pt.sale_ok = true
    and pt.active = true
    and pt.is_capital_fundraising = false
    and pt.fiscal_classification_id = 3
    