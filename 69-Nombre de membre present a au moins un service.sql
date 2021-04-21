/* 
 -------- Description --------




 -------- Filters translation -------- 


 -------- SQL -------- */

select
    count(distinct name),
    date_trunc('month', date_begin) as "date"
from
    shift_registration
where
    cast(date_begin as timestamp)  >= date_trunc('month', current_date - interval '13' month)
    and state = 'done'
group by "date"
order by date desc