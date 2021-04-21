/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select s.create_date as "Mois", avg(s.month_total)
from (
    select
        date_trunc('month', cast(pos_order.create_date as timestamp)) as create_date,
        case
            when res_partner.parent_id is not null then res_partner.parent_id
            else res_partner.id
        end as foyer,
        sum(pos_order_line.price_subtotal_incl) as month_total
    from pos_order_line
    left join pos_order on pos_order_line.order_id = pos_order.id
    inner join res_partner on pos_order.partner_id = res_partner.id
    where
        cast(pos_order.create_date as timestamp)  >= date_trunc('month', current_date - interval '13' month)
    group by date_trunc('month', cast(pos_order.create_date as timestamp)), foyer
    ) as s
group by s.create_date
order by s.create_date asc