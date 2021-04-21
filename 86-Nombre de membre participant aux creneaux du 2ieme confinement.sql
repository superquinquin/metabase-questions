/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    date_trunc('month', cast(shift_counter_event.create_date as timestamp)) as "Mois",
    count(distinct res_partner.name) as "Nombre de cooperateurs"
from
    shift_counter_event
    inner join res_partner on res_partner.id = shift_counter_event.partner_id
where
    shift_counter_event.create_date > '2020-11-01'
    and shift_counter_event.type = 'ftop'
    and shift_counter_event.point_qty = 1
    and shift_counter_event.is_manual = true
group by date_trunc('month', cast(shift_counter_event.create_date as timestamp))