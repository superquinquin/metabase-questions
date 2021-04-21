/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select date_trunc('month', cast(pos_order.create_date as timestamp)) as "Mois",
count (distinct case
    when res_partner.parent_id is not null then res_partner.parent_id
    else res_partner.id
end) as foyer
from pos_order
inner join res_partner on pos_order.partner_id = res_partner.id
where
    cast(pos_order.create_date as timestamp)  >= date_trunc('month', current_date - interval '13' month)
group by date_trunc('month', cast(pos_order.create_date as timestamp))
order by date_trunc('month', cast(pos_order.create_date as timestamp)) asc