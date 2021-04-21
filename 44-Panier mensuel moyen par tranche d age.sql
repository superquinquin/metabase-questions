/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    t1.create_date as "Mois",
    avg(t1.month_total) as "Tranche 1",
    avg(t2.month_total) as "Tranche 2",
    avg(t3.month_total) as "Tranche 3"
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
    where cast(pos_order.create_date as date) >= cast('2019-09-01T00:00:00.000Z'::timestamp as date)
        and cast(pos_order.create_date as date) < date_trunc('month', current_timestamp)
        and date_part('month', cast(pos_order.create_date as timestamp)) != 8
        and age(to_date(res_partner.birthdate, 'YYYY-MM-DD')) >= interval '18 years'
        and age(to_date(res_partner.birthdate, 'YYYY-MM-DD')) <= interval '25 years'
    group by date_trunc('month', cast(pos_order.create_date as timestamp)), foyer
    ) as t1
inner join (
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
    where cast(pos_order.create_date as date) >= cast('2019-09-01T00:00:00.000Z'::timestamp as date)
        and cast(pos_order.create_date as date) < date_trunc('month', current_timestamp)
        and date_part('month', cast(pos_order.create_date as timestamp)) != 8
        and age(to_date(res_partner.birthdate, 'YYYY-MM-DD')) >= interval '26 years'
        and age(to_date(res_partner.birthdate, 'YYYY-MM-DD')) <= interval '35 years'
    group by date_trunc('month', cast(pos_order.create_date as timestamp)), foyer
    ) as t2 on t1.create_date = t2.create_date
inner join (
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
    where cast(pos_order.create_date as date) >= cast('2019-09-01T00:00:00.000Z'::timestamp as date)
        and cast(pos_order.create_date as date) < date_trunc('month', current_timestamp)
        and date_part('month', cast(pos_order.create_date as timestamp)) != 8
        and age(to_date(res_partner.birthdate, 'YYYY-MM-DD')) >= interval '36 years'
        and age(to_date(res_partner.birthdate, 'YYYY-MM-DD')) <= interval '45 years'
    group by date_trunc('month', cast(pos_order.create_date as timestamp)), foyer
    ) as t3 on t1.create_date = t3.create_date
group by t1.create_date
order by t1.create_date asc